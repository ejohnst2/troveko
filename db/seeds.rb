Identity.destroy_all
Contribution.destroy_all
Trip.destroy_all
Experience.destroy_all
Feature.destroy_all
Activity.destroy_all
Areatype.destroy_all
Fund.destroy_all
User.destroy_all

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end


features = [
Feature.create!(name: "Power", fa_icon: "fa-plug"),
Feature.create!(name: "Heating", fa_icon: "fa-thermometer-three-quarters"),
Feature.create!(name: "Cooling", fa_icon: "fa-thermometer-quarter"),
Feature.create!(name: "Wi-Fi", fa_icon: "fa-wifi"),
Feature.create!(name: "Mobile Connection", fa_icon: "fa fa-mobile"),
Feature.create!(name: "Private Accomodation", fa_icon: "fa fa-bed"),
Feature.create!(name: "Shared Accomodation", fa_icon: "fa fa-users"),
Feature.create!(name: "Fresh Water Supply", fa_icon: "fa fa-tint"),
Feature.create!(name: "Overhead Shower", fa_icon: "fa fa-shower")

]

activities = [
Activity.create!(name: "Hiking", fa_icon: "fa-blind"),
Activity.create!(name: "Trekking", fa_icon: "fa-blind"),
Activity.create!(name: "Cooking", fa_icon: "fa fa-cutlery"),
Activity.create!(name: "Camping", fa_icon: "fa-fire"),
Activity.create!(name: "Fishing", fa_icon: "fa-ship"),
Activity.create!(name: "Handicrafts", fa_icon: "fa-shopping-basket"),
Activity.create!(name: "Cycling", fa_icon: "fa fa-bicycle"),
Activity.create!(name: "Construction", fa_icon: "fa fa-wrench")
]


areatypes = [
Areatype.create!(name: "Farm", fa_icon: "fa-envira"),
Areatype.create!(name: "Mountainous", fa_icon: "fa-picture-o"),
Areatype.create!(name: "Desert", fa_icon: "fa fa-sun-o"),
Areatype.create!(name: "Rainforest", fa_icon: "fa fa-leaf"),
Areatype.create!(name: "Jungle", fa_icon: "fa-pagelines"),
Areatype.create!(name: "Woods", fa_icon: "fa-tree"),
Areatype.create!(name:"Plains", fa_icon: "fa-snowflake-o")
]



project_kalpa = User.new(email: 'sayoga@projectkalpa.org', password:
'projectkalpa', ngo: true)
project_kalpa.save!

rajmachi_rural_aid = User.new(email: 'admin@rajmachiruralaid.org', password:
'ruralaid', ngo: true)
rajmachi_rural_aid.save!

toasty_boy = User.new(email: 'toastyboy@gmail.com', password: 'bunky123', ngo:
false)
toasty_boy.save!

backpacking_couple = User.new(email: 'backpackingcouple@gmail.com', password:
'bunky123', ngo: false)
backpacking_couple.save!



bali_fund_one = Fund.new(   user: project_kalpa,   funding_goal: 10000,   title:
"Community Center for Farmers and Youth",   about: "The Subak Landscape   of
Catur Angga Batukaru has no central meeting place for farmers and no center
for youth to come together for learning and socializing. In efforts to improve
the livelihoods of the families living in the community, we are constructing a
community center.",   use_of_funds: "Roughly half of the funds will go towards
to   sourcing the land, whether leasing it from a farmer or purchasing it. The
other   will go towards the raw materials needed to build the structure and put
basic   interior design. The labor and the organization of the community center
can be   done on a voluntary basis." )




bali_photos_one = [ seed_image('L1840124-1184x662'), seed_image('L1840358-1184x666'), seed_image('L1840358-1184x666') ]

bali_experience_one = Experience.new(   user: project_kalpa,   title:
"Educational Homestay in Piling",   price: 200,   capacity: 5,   status: true,
address: "Jl. Batu Mejan No. 88",   latitude: -8.355552,   longitude:
115.089274,   long_description: "Ketut Suadha and his family of 5 live in the
village of Piling. His extended family including brothers, aunts, uncles, and
cousins live across from him, making it a tight-knit community. Born and raised
in Piling, Ketut Suadha moved his family to Central Java for his work as a Civil
Servant, and in 1998 returned to his native village, Piling where he works as a
rice farmer. His two sons work in the South of Bali but come back to the village
for the weekend, and the whole family would love share their home with you and
have you experience life in their village and their Subak. Piling is a small
village surrounded by rice fields and thick forest, and is situated at the slope
of Mount Batukaru. Piling is also well known for its harmonious relationship
between Hindu and Christian community, which is evident through its two churches
in the local settlement.",   short_description: "Enjoy local crafts and live
with a lovely family in the quaint rice-terraced village of Piling",   city:
"Bali",   postal_code: "5102060",   country: "Indonesia",   fund: bali_fund_one,
duration: 3,   highlights: "Travelers will have the chance to: a) get in-depth
insight on the history, customs, and practices that shape Jatiluwih, b) Learn
traditional gardening and farming methods as well as age-old ceremonies and
rituals in the rice field, c) Learn how to cook traditional Balinese food and
desert using local ingredients, d) visit various hot springs and bathing houses
in nearby villages for a warm nature cleanse, e) Hike to the 2,000m peak of the
Mount Batukaru, f)Trek through the endless rice fields of Jatiluwih, Explore
untouched forests and see waterfalls, Visit the five surrounding temples.",
transportation: "The closest airport is Denpasar International Airport. For those
that are located ",  guided: true   )

  bali_experience_one.features << [ features.sample, features.sample ]
  bali_experience_one.activities << [ activities.sample, activities.sample ]
  bali_experience_one.areatypes << [ areatypes.sample ]
  bali_experience_one.photo_urls = bali_photos_one
  bali_experience_one.save!


bali_photos_two = [ seed_image('L1840124-1184x662'), seed_image('tengkudak-kitchen') ]

bali_experience_two = Experience.new( user: project_kalpa,   title: "Cooking
and Temples in Tengkudak",   price: 200,   capacity: 5,   status: true,
address: "Jl. Batu Mejan No. 88",   latitude: -8.417752,   longitude:
115.117740,   long_description: "Nyoman Sutiani and her two brothers are based
in the village of Tengkudak. She owns rice fields that are managed by her
brothers, and has opened a small shop outside of her house a couple months ago
to be able to make ends meet. She is the youngest of three, and her middle
brother is the Head of Subak for Tengkudak. Her and her family would love to
host travelers that are interested in learning about the local Subak. The family
believes that hosting travelers both local and foreign could be a stepping-stone
to promote Subak as the world heritage site that it is. Welcome to the village
of Tengkudak, surrounded by rice fields and situated at the slope of Mount
Batukaru. Because of its geography it has a slightly colder temperature than
surrounding villages. The village displays a harmonious relationship of Hinduism
and Catholicism, and the farmers in this village belong the Subak Penatahan.",
short_description: "Learn local cooking and take part in temple ceremonies",
city: "Bali",   postal_code: "5102060",   country: "Indonesia",   fund:
bali_fund_one,   duration: 3,   highlights: "Travelers will have the chance to:
a) get in-depth insight on the history, customs, and practices that shape
Jatiluwih, b) Learn traditional gardening and farming methods as well as age-old
ceremonies and rituals in the rice field, c) Learn how to cook traditional
Balinese food and desert using local ingredients, d) visit various hot springs
and bathing houses in nearby villages for a warm nature cleanse, e) Hike to the
2,000m peak of the Mount Batukaru, f)Trek through the endless rice fields of
Jatiluwih, Explore untouched forests and see waterfalls, Visit the five
surrounding temples.",   transportation:"The closest airport is Denpasar
International Airport. For those that are located",   guided: true   )

bali_experience_two.features << [ features.sample, features.sample ]
bali_experience_two.activities << [ activities.sample, activities.sample ]
bali_experience_two.areatypes << [ areatypes.sample ]
bali_experience_two.photo_urls = bali_photos_two
bali_experience_two.save!


bali_photos_three = [ seed_image('jatiluwih-host-1200x671'), seed_image('L1840124-1184x662'), seed_image('jatiluwih-gate-1200x800') ]




bali_experience_three = Experience.new(   user: project_kalpa,   title: "Rice
Terrace Experience",   price: 200,   capacity: 5,   status: true,   address:
"Jl. Batu Mejan No. 88",   latitude: -8.371517,   longitude: 115.131846,
long_description: "Nyoman Sutama and his family of 5 are based in the village of
Jatiluwih. Nyoman is the Head of the Subak cluster (the 20 communities
combined), and has over 50 years of experience as a rice farmer, making him
highly skilled in traditional Balinese methods that date back centuries. In
recent years, he has faced many challenges including water shortages to irrigate
rice fields, pressure to convert farmland into commercial settlements, more
frequent pest problems, and declining price of rice. Him and his family would
love to welcome you into their home to exchange laughs, smiles, and culture,
making for an enriching and impactful travel experience. The village of
Jatiluwih has the most notable Subak community in its cluster, it is a quaint
and rustic village well knows for it’s beautiful terraced rice fields.",
short_description: "Stay with the head of the Subak and learn how it works",
city: "Bali",   postal_code: "5102060",   country: "Indonesia",   fund:
bali_fund_one,   duration: 3,   highlights: "Travelers will have the chance to:
a) get in-depth insight on the history, customs, and practices that shape
Jatiluwih, b) Learn traditional gardening and farming methods as well as age-old
ceremonies and rituals in the rice field, c) Learn how to cook traditional
Balinese food and desert using local ingredients, d) visit various hot springs
and bathing houses in nearby villages for a warm nature cleanse, e) Hike to the
2,000m peak of the Mount Batukaru, f)Trek through the endless rice fields of
Jatiluwih, Explore untouched forests and see waterfalls, Visit the five
surrounding temples.",  transportation:"The closest airport is Denpasar
International Airport. For those that are located.",   guided: true   )

  bali_experience_three.features << [ features.sample, features.sample ]
  bali_experience_three.activities << [ activities.sample, activities.sample ]
  bali_experience_three.areatypes << [ areatypes.sample ]
  bali_experience_three.photo_urls = bali_photos_three
  bali_experience_three.save!



rajmachi_fund_one = Fund.new(
user: project_kalpa,
funding_goal: 5000,
title: "Improve Living Conditions of Community",
about: "Rajmachi fort has
been declared as a protected monument. Despite the glorious historical past,
most of the families have been living a neglected backward life. The people
living here belong to the Mahadev Koli Tribe. Generally ‘Koli’ means a fisherman
but they are primarily engaged in agriculture. The Mahadev Koli Tribe derive
their name from their God – Mahadev and live in the Mahadev hills of
Maharashtra. They speak Marathi and use the Devanagari script. The villagers are
low on quality of life since access to resources like health care services,
education for children, water facilities, electricity and so on is meagre. The
evident cause for this disparateness is poor road connectivity. The villagers
are compelled to migrate to bigger cities where they end up doing menial jobs in
order to ensure their children’s education.",
use_of_funds: "Their aim was and
is to preserve the historical monument, provide livelihood options to the
villagers and make sincere efforts to wean the people away from addiction to
alcohol. It also makes strides in removing various harmful superstitions
prevalent in the community."   )

rajmachi_fund_two = Fund.new(   user: project_kalpa,   funding_goal: 3000,
title: "Rainwater Harvesting for Village",   about: "Rajmachi fort has been
declared as a protected monument. Despite the glorious historical past, most of
the families have been living a neglected backward life. The people living here
belong to the Mahadev Koli Tribe. Generally ‘Koli’ means a fisherman but they
are primarily engaged in agriculture. The Mahadev Koli Tribe derive their name
from their God – Mahadev and live in the Mahadev hills of Maharashtra. They
speak Marathi and use the Devanagari script. The villagers are low on quality of
life since access to resources like health care services, education for
children, water facilities, electricity and so on is meagre. The evident cause
for this disparateness is poor road connectivity. The villagers are compelled to
migrate to bigger cities where they end up doing menial jobs in order to ensure
their children’s education.",   use_of_funds: "Rajmachi fort has been declared
as a protected monument. Despite the glorious historical past, most of the
families have been living a neglected backward life. The people living here
belong to the Mahadev Koli Tribe. Generally ‘Koli’ means a fisherman but they
are primarily engaged in agriculture. The Mahadev Koli Tribe derive their name
from their God – Mahadev and live in the Mahadev hills of Maharashtra. They
speak Marathi and use the Devanagari script. The villagers are low on quality of
life since access to resources like health care services, education for
children, water facilities, electricity and so on is meagre. The evident cause
for this disparateness is poor road connectivity. The villagers are compelled to
migrate to bigger cities where they end up doing menial jobs in order to ensure
their children’s education."   )



rajmachi_photos_one = [ seed_image('IMG_3353-1184x662') ]


rajmachi_experience_one = Experience.new(   user: rajmachi_rural_aid,   title:
"Trekking Shrivardhan Mountains",   price: 100,   capacity: 10,   status: true,
address: "Village Udhewadi, Khandala", latitude: 17.318649,   longitude:
74.235628,  long_description: "A plateau rich in history, culture and beautiful
hills, Rajmachi has two fortified peaks – Shrivardhan and Manaranjan forts, with
a small village Udhewadi located near two famous hills of Lonavala and Khandala
in the Sahyadri mountain range of the Konkan region of Maharashtra. Rajmachi,
one of the most loved and frequented destinations by avid travellers and trek
enthusiasts, has paved a way to livelihood opportunities for the impoverished
villagers who are residents of this geographically remote place. Over the years
many households have been providing rooms and food facilities for fellow-
travellers, sparking a shift from agriculture to tourism for their livelihoods.
Tourism is an industry like no other. However, unplanned growth without proper
structuring has led to harm the environment, natural and cultural resources such
as water resources, heritage sites etc. There also exists exploitation of
villagers as they get paid less by the trek organisers.",  short_description:
"Trekking and village-stay through the hills of Rajmachi",  city: "Pune",
postal_code: "415105", country: "India", fund: rajmachi_fund_one,  duration: 2,
highlights: "The experience includes trekking, learning to cook ethnic food,
heritage walks, and your homestay. You will learn about local life in Rajmachi,
how to cook ethnic food, and the history of the area.", transportation:"Rajmachi
is located at about 99 kilometres from Mumbai and can be easily reached via road
in about couple of hours. It is accessible via train too, but a road trip is
more fun and pleasurable. Here is the route for Mumbai-Rajmachi. Best way to
cover Mumbai to Rajmachi is: Mumbai – 26 kilometres – Navi Mumbai – 24 kilometre
-Bhatan Tunnel – 58 kilometre – Khandala – 15 kilometre – Rajmachi. To reach
this place easily, follow Mumbai to Pune Expressway and NH4 to Masur to Umbraj
Rd in Umbraj. The road is very easy to navigate and in an excellent condition
with a lot of ATMs and drive in restaurants.", guided: true   )

  rajmachi_experience_one.features << [ features.sample, features.sample ]
  rajmachi_experience_one.activities << [ activities.sample, activities.sample ]
  rajmachi_experience_one.areatypes << [ areatypes[1] ]
  rajmachi_experience_one.photo_urls = rajmachi_photos_one
  rajmachi_experience_one.save!



rajmachi_photos_two = [ seed_image('IMG_3353-1184x662') ]


rajmachi_experience_two = Experience.new(   user: rajmachi_rural_aid,   title:
"Trekking Manaranjan Mountains",   price: 75,   capacity: 6,   status: true,
address: "Village Udhewadi, Khandala",   latitude: 17.318649, longitude:
74.235628,   long_description: "A plateau rich in history, culture and beautiful
hills, Rajmachi has two fortified peaks – Shrivardhan and Manaranjan forts, with
a small village Udhewadi located near two famous hills of Lonavala and Khandala
in the Sahyadri mountain range of the Konkan region of Maharashtra. Rajmachi,
one of the most loved and frequented destinations by avid travellers and trek
enthusiasts, has paved a way to livelihood opportunities for the impoverished
villagers who are residents of this geographically remote place. Over the years
many households have been providing rooms and food facilities for fellow-
travellers, sparking a shift from agriculture to tourism for their livelihoods.
Tourism is an industry like no other. However, unplanned growth without proper
structuring has led to harm the environment, natural and cultural resources such
as water resources, heritage sites etc. There also exists exploitation of
villagers as they get paid less by the trek organisers.",   short_description: "A
weekend getaway through the hills of Rajmachi",   city: "Pune",   postal_code:
"415105",   country: "India",   fund: rajmachi_fund_two,   duration: 2,
highlights: "The experience includes trekking, learning to cook ethnic food,
heritage walks, and your homestay. You will learn about local life in Rajmachi,
how to cook ethnic food, and the history of the area.",
transportation:"Rajmachi is located at about 99 kilometres from Mumbai and can
be easily reached via road in about couple of hours. It is accessible via train
too, but a road trip is more fun and pleasurable. Here is the route for Mumbai-
Rajmachi. Best way to cover Mumbai to Rajmachi is: Mumbai – 26 kilometres – Navi
Mumbai – 24 kilometre -Bhatan Tunnel – 58 kilometre – Khandala – 15 kilometre –
Rajmachi. To reach this place easily, follow Mumbai to Pune Expressway and NH4
to Masur to Umbraj Rd in Umbraj. The road is very easy to navigate and in an
excellent condition with a lot of ATMs and drive in restaurants.", guided: true
)


  rajmachi_experience_two.features << [ features.sample, features.sample ]
  rajmachi_experience_two.activities << [ activities.sample, activities.sample ]
  rajmachi_experience_two.areatypes << [ areatypes[1] ]
  rajmachi_experience_two.photo_urls = rajmachi_photos_two
  rajmachi_experience_two.save!

start_date = Date.today + rand(20..50).days

10.times do
    trip = Trip.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , experience_id: [bali_experience_one, bali_experience_two, bali_experience_three, rajmachi_experience_one, rajmachi_experience_two].sample.id, status: true, start_date: start_date, user: [rajmachi_rural_aid, project_kalpa].sample, number_of_people: [1, 2, 3].sample)
    contribution = Contribution.create(user_id: [backpacking_couple, toasty_boy].sample.id, fund_id: trip.experience.fund.id, trip_id: trip.id, amount: [50, 20, 40, 60].sample)
  end

# 8.times do
#   urls = [ pictures.sample, pictures.sample, pictures.sample ]
#   fund = Fund.create!(user_id: traveler.id, funding_goal_cents: rand(2000000..4000000), title: "Building #{Faker::Educator.campus} for the Community", about: Faker::Lorem.sentence, use_of_funds: Faker::Lorem.paragraphs )

#   experience = Experience.new(
#     title: "#{Faker::Zelda.location} experience",
#     short_description: "#{Faker::LordOfTheRings.character}-style #{Faker::GameOfThrones.house} in #{Faker::LordOfTheRings.location}",
#     long_description: "#{Faker::Lorem.paragraphs}",
#     price: rand(400..1000),
#     capacity: rand(1..10),
#     address: Faker::Address.street_address,
#     city: Faker::Address.city,
#     country: Faker::Address.country,
#     postal_code: Faker::Address.postcode,
#     latitude: Faker::Address.latitude,
#     longitude: Faker::Address.longitude,
#     user: new_user_one,
#     fund: fund
#     )
#   p experience
#   experience.features << [features.sample, features.sample, features.sample, features.sample, features.sample]
#   experience.activities << [activities.sample, activities.sample, activities.sample, activities.sample]
#   experience.areatypes << [areatypes.sample]
#   experience.photo_urls = urls
#   experience.save!


#   3.times do
#     trip = Trip.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name , experience_id: experience.id, status: true, start_date: start_date, end_date: start_date + rand(4..10).days, user: traveler)
#     contribution = Contribution.create(user_id: traveler.id, fund_id: fund.id, trip_id: trip.id, amount: [1500, 220, 415, 600].sample)
#   end
# end

