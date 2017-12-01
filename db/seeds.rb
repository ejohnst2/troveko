# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Contribution.destroy_all
Trip.destroy_all
Experience.destroy_all
Feature.destroy_all
Activity.destroy_all
Areatype.destroy_all
Fund.destroy_all
User.destroy_all

new_user_one = User.new(email: 'trovekoboy@gmail.com', password: 'bunky123', ngo: true)
new_user_one.save!

new_user_two = User.new(email: 'trovekogirl@gmail.com', password: 'bunky123', ngo: true)
new_user_two.save!

traveler = User.new(email: 'travelergirl@gmail.com', password: 'bunky123', ngo: false)
traveler.save!


features = [
  Feature.create!(name: "Power", fa_icon: "fa-plug"),
  Feature.create!(name: "Heating", fa_icon: "fa-thermometer-three-quarters"),
  Feature.create!(name: "Cooling", fa_icon: "sfa-thermometer-quarter"),
  Feature.create!(name: "Wi-Fi", fa_icon: "fa-wifi"),
  Feature.create!(name: "Mobile Connection", fa_icon: "fa-mobile"),
  Feature.create!(name: "Private Accomodation", fa_icon: "fa-bed"),
  Feature.create!(name: "Shared Accomodation", fa_icon: "fa-users"),
  Feature.create!(name: "Fresh Water Supply", fa_icon: "fa-tint"),
  Feature.create!(name: "Overhead Shower", fa_icon: "fa-shower")
]

activities = [
  Activity.create!(name: "Hiking", fa_icon: "fa-sun-o"),
  Activity.create!(name: "Trekking", fa_icon: "fa-thermometer-three-quarters"),
  Activity.create!(name: "Cooking", fa_icon: "fa-cutlery"),
  Activity.create!(name: "Camping", fa_icon: "fa-bed"),
  Activity.create!(name: "Fishing", fa_icon: "fa-tint"),
  Activity.create!(name: "Handicrafts", fa_icon: "fa-cutlery"),
  Activity.create!(name: "Cycling", fa_icon: "fa-bicycle")
]

areatypes = [
  Areatype.create!(name: "Farm", fa_icon: "fa-sun-o"),
  Areatype.create!(name: "Mountainous", fa_icon: "fa-thermometer-three-quarters"),
  Areatype.create!(name: "Desert", fa_icon: "fa-sun-o"),
  Areatype.create!(name: "Rainforest", fa_icon: "fa-wifi"),
  Areatype.create!(name: "Jungle", fa_icon: "fa-wifi"),
  Areatype.create!(name: "Woods", fa_icon: "fa-tree"),
  Areatype.create!(name: "Plains", fa_icon: "fa-wifi"),
]

pictures = [
  "https://static.boredpanda.com/blog/wp-content/uploads/2014/04/village-life-indonesia-herman-damar-4.jpg",
  "http://static.panoramio.com/photos/large/11506049.jpg",
  "http://www.villabalisale.com/uploads/images/post/2016-12-09-post-584a283cc65f9.jpg",
  "https://static.boredpanda.com/blog/wp-content/uploads/2014/04/village-life-indonesia-herman-damar-13.jpg",
  "https://www.wildfrontierstravel.com/media/cache/responsive/opengraph-1200/axum/Web%20Images%20-%20Axum-FTP/B-Suggested%20Itineraries%20Carousel%20%28New%29/Indian%20Subcontinent/Village%20India/Village-India-01.jpg",
  "https://d2391rlyg4hwoh.cloudfront.net/img/original/dscn4779.jpg",
  "http://s2.dmcdn.net/W-h5n/1280x720-m6-.jpg",
  "https://qph.ec.quoracdn.net/main-qimg-470373c785fb061e1a5b3d3baabc2f54-c",
  "http://www.planetware.com/photos-large/CAM/cambodia-tonle-sap-lake-floating-village.jpg",
  "https://s-i.huffpost.com/gadgets/slideshows/354802/slide_354802_3882730_free.jpg",
  "https://brittanydeseau.files.wordpress.com/2011/03/ladakhvillage.jpg",
  "https://photos.smugmug.com/Imagesofasia/PhotoStories/Meemure-Sri-Lanka-Village/i-s7K3h8m/0/21f9d767/L/Villagers%20having%20chat%20between%20them%20and%20walking%20a%20scenic%20road%20in%20Meemure%20village%20-%20Sri%20Lanka-L.jpg",
  "https://www.ulpotha.com/images/top-banner/4.jpg",
  "http://proof.nationalgeographic.com/files/2015/03/150318-ken-garrett-07.jpg",
  "http://photovide.com/wp-content/uploads/2014/04/Traveler/28b.jpg",
  "http://proof.nationalgeographic.com/files/2015/12/151231-jessie-wender-nye-03.jpg"
]

6.times do
  urls = [ pictures.sample, pictures.sample, pictures.sample ]
  fund = Fund.create!(user_id: traveler.id, funding_goal: rand(20000..40000), title: "Building #{Faker::Educator.campus} for the Community", about: Faker::Lorem.sentence, use_of_funds: Faker::Lorem.paragraphs )

  experience = Experience.new(
    title: "#{Faker::Zelda.location} experience",
    short_description: "#{Faker::LordOfTheRings.character}-style #{Faker::GameOfThrones.house} in #{Faker::LordOfTheRings.location}",
    long_description: "#{Faker::Lorem.paragraphs}",
    price_cents: rand(4000..10000),
    capacity: rand(1..10),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    country: Faker::Address.country,
    postal_code: Faker::Address.postcode,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    user: new_user_one,
    fund: fund
    )
  p experience
  experience.features << [features.sample, features.sample, features.sample, features.sample, features.sample]
  experience.activities << [activities.sample, activities.sample, activities.sample, activities.sample]
  experience.areatypes << [areatypes.sample]
  experience.photo_urls = urls
  experience.save!

  start_date = Date.today + rand(20..50).days

  3.times do
    trip = Trip.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , experience_id: experience.id, status: true, start_date: start_date, end_date: start_date + rand(4..10).days, user: traveler)
    contribution = Contribution.create(user_id: traveler.id, fund_id: fund.id, trip_id: trip.id, amount: [1500, 420, 415, 600, 1800, 2000].sample)
  end
end

