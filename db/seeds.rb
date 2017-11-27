# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Experience.destroy_all
User.destroy_all
Feature.destroy_all


new_user_one = User.new(email: 'trovekoboy@gmail.com', password: 'bunky123')
new_user_one.save!

new_user_two = User.new(email: 'trovekogirl@gmail.com', password: 'bunky123')
new_user_two.save!

addresses = [
  "16 Ladeira da Gloria",
  "33 Pheng Geck Road",
  "1109 E 93 street",
  "Ladeira da Glória, 26",
  "100 Century Ave, LuJiaZui",
  "11 Wall St",
  "Jl. Beji Ayu No.8",
  "501 Yincheng Middle Rd",
  "6 Rue de l'Amiral de Coligny",
  "16 villa gaudlet, paris"
]

features = [
  Feature.create!(name: "Solar Power", fa_icon: "fa-sun-o"),
  Feature.create!(name: "Heating", fa_icon: "fa-thermometer-three-quarters"),
  Feature.create!(name: "Wi-Fi", fa_icon: "fa-wifi"),
  Feature.create!(name: "Private Accomodation", fa_icon: "fa-bed"),
  Feature.create!(name: "Fresh Water", fa_icon: "fa-tint"),
  Feature.create!(name: "Personal Chef", fa_icon: "fa-cutlery")
]

3.times do
  # urls = [ pictures.sample, pictures.sample, pictures.sample ]
  experience = Experience.new(
    title: "#{Faker::Zelda.location} experience",
    short_description: "#{Faker::LordOfTheRings.character}-style #{Faker::GameOfThrones.house} in #{Faker::LordOfTheRings.location}",
    long_description: "#{Faker::Lorem.paragraphs} #{Faker::Lorem.paragraphs}",
    price: rand(40..1000),
    capacity: rand(1..10),
    address: addresses.sample,
    user: new_user_one
    )
  p experience
  experience.features = features
  # experience.photo_urls = urls
  experience.save!
  puts "======> created #{new_user_one.email} and #{experience.title}"
end

3.times do
  # urls = [ pictures.sample, pictures.sample, pictures.sample ]
  experience = Experience.new(
    title: "#{Faker::Zelda.location} experience",
    short_description: "#{Faker::LordOfTheRings.character}-style #{Faker::GameOfThrones.house} in #{Faker::LordOfTheRings.location}",
    long_description: "#{Faker::Lorem.paragraphs} #{Faker::Lorem.paragraphs}",
    price: rand(40..1000),
    capacity: rand(1..10),
    address: addresses.sample,
    user: new_user_two
    )
  p experience
  experience.features = features
  # experience.photo_urls = urls
  experience.save!
  puts "======> created #{new_user_two.email} and #{experience.title}"
end

  # create_table "experiences", force: :cascade do |t|
  #   t.bigint "user_id"
  #   t.string "title"
  #   t.float "price"
  #   t.integer "capacity"
  #   t.boolean "status", default: false
  #   t.string "address"
  #   t.float "latitude"
  #   t.float "longitude"
  #   t.text "long_description"
  #   t.string "short_description"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_experiences_on_user_id"
  # end
