class Experience < ApplicationRecord
  # check if need to implement chnanged method https://github.com/lewagon/google-maps-autocomplete/blob/323ef5fef39d094d042c7266466a10fb4b70c8b8/app/models/flat.rb
  include PgSearch
  multisearchable against: [:title, :short_description, :city, :address, :postal_code, :country]


  belongs_to :user
  has_attachments :photos, maximum: 10
  has_many :reviews, dependent: :destroy
  has_many :trips, dependent: :destroy

  has_and_belongs_to_many :features
  has_and_belongs_to_many :activities
  has_and_belongs_to_many :areatypes
  belongs_to :fund
  has_many :conversations, dependent: :destroy

  validates :price_cents, presence: true
  validates :title, presence: true, length: { minimum: 10 }
  validates :short_description, presence:true, length: { maximum: 100 }
  validates :long_description, presence:true, length: { minimum: 100, maximum: 1000 }
  validates :address, presence: true, allow_blank: false, length: { minimum: 5 }
  validates :city, presence: true, allow_blank: false, length: { minimum: 3 }
  validates :postal_code, presence: true, allow_blank: false, length: { minimum: 2 }
  validates :country, presence: true, allow_blank: false, length: { minimum: 2 }
  validates :capacity, presence:true, numericality: { only_integer: true }
  validates :user, presence: true, allow_blank: false
  validates :duration, presence: true

  monetize :price

  geocoded_by :full_address
  after_validation :geocode, if: :full_address_changed?

  def self.search(query)
    if query.present?
      search_results = []
      results = PgSearch.multisearch(query)
      results.each do |result|
        if result.searchable_type == "Fund"
          experience_result = Experience.where(fund: Fund.find(result.searchable_id.to_i).id)
          experience_result.each do |experience|
            search_results << experience
          end
        else
          search_results << result.searchable
        end
      end
      search_results.uniq
    else
      Experience.all
    end
  end

  def full_address
    "#{address}, #{postal_code} #{city} #{country}"
  end

  def full_address_changed?
    address_changed? || postal_code_changed? || city_changed? || country_changed?
  end
end
