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
Activity.destroy_all


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

activities = [
  Activity.create!(name: "Hiking", fa_icon: "fa-sun-o"),
  Activity.create!(name: "Trekking", fa_icon: "fa-thermometer-three-quarters"),
  Activity.create!(name: "Cooking", fa_icon: "fa-wifi"),
  Activity.create!(name: "Camping", fa_icon: "fa-bed"),
  Activity.create!(name: "Fishing", fa_icon: "fa-tint"),
  Activity.create!(name: "Handicrafts", fa_icon: "fa-cutlery")
]

areatypes = [
  Areatype.create!(name: "Farm", fa_icon: "fa-sun-o"),
  Areatype.create!(name: "Mountainous", fa_icon: "fa-thermometer-three-quarters"),
  Areatype.create!(name: "Desert", fa_icon: "fa-wifi"),
]

pictures = [
  "http://yourshot.nationalgeographic.com/u/fQYSUbVfts-T7odkrFJckdiFeHvab0GWOfzhj7tYdC0uglagsDQmfkyv8JBdgoks3HiyL0zo7bi4A3XodBJPUesqEy-0dgsZUaS7Y4Qpm67ypHveGo14D0K63HGKvjJ2P0MEjvptFQz0qXHpp1hKSjJJvoSmlO01hLNK_L-o_Qyfd0iVGOLu9cl0D8aXdSkQrPUYNGv6cntZIpbPTeEQJSom/",
  "http://www.theblogismine.com/wp-content/uploads/2013/10/National-Geographic-Launches-YourShot-Photo-Sharing-Platform-01.jpg",
  "http://naturephotojournal.com/wp-content/uploads/2013/10/12_prod-yourshot-321272-2071224.jpg",
  "http://nnimgt-a.akamaihd.net/transform/v1/crop/frm/storypad-GJZ5TVpAk84wrTzsQfLQRB/cb8098bb-b1ea-4dcc-9959-d0f07e8e37ba.jpg/r0_182_3500_2150_w1200_h678_fmax.jpg",
  "http://tekey.net/b/wp-content/uploads/2015/05/Maravillosas-tomas-de-la-vida-cotidiana-en-Indonesia-2.jpg"
]

8.times do
  urls = [ pictures.sample ]
  experience = Experience.new(
    title: "#{Faker::Zelda.location} experience",
    short_description: "#{Faker::LordOfTheRings.character}-style #{Faker::GameOfThrones.house} in #{Faker::LordOfTheRings.location}",
    long_description: "#{Faker::Lorem.paragraphs}",
    price: rand(40..1000),
    capacity: rand(1..10),
    address: "1109 e 93 street",
    city: "brooklyn",
    country: "united states",
    postal_code: "11236",
    user: new_user_one
    )
  p experience
  experience.features << features
  experience.activities << activities
  experience.areatypes << areatypes
  experience.photo_urls = urls
  experience.save!
  puts "======> created #{new_user_one.email} and #{experience.title}"
end

# 3.times do
#   # urls = [ pictures.sample, pictures.sample, pictures.sample ]
#   experience = Experience.new(
#     title: "#{Faker::Zelda.location} experience",
#     short_description: "#{Faker::LordOfTheRings.character}-style #{Faker::GameOfThrones.house} in #{Faker::LordOfTheRings.location}",
#     long_description: "#{Faker::Lorem.paragraphs}",
#     price: rand(40..1000),
#     capacity: rand(1..10),
#     address: addresses.sample,
#     user: new_user_two
#     )
#   p experience
#   experience.features << features
#   experience.activities << activities
#   experience.areatypes << areatypes
#   # experience.photo_urls = urls
#   experience.save!
#   puts "======> created #{new_user_two.email} and #{experience.title}"
# end

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
