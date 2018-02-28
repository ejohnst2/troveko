Identity.destroy_all
Contribution.destroy_all
Order.destroy_all
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
new_user_one = User.new(email: 'trovekoboy@troveko.com', password: 'bunky123', ngo: true)
new_user_one.save!

new_user_two = User.new(email: 'trovekogirl@troveko.com', password: 'bunky123', ngo: true)
new_user_two.save!

traveler = User.new(email: 'travelergirl@troveko.com', password: 'bunky123', ngo: false)
traveler.save!


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
Activity.create!(name: "Ceremony", fa_icon: "fa fa-check-square"),
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
Areatype.create!(name: "Plains", fa_icon: "fa-snowflake-o")
]



project_kalpa = User.new(
  email: 'sayoga@projectkalpa.org',
  password:'projectkalpa',
  ngo: true,
  facebook_picture_url: ("NGO.png"),
  first_name: 'Adi Sayoga',
  last_name: 'Puti',
  mission: "In ProjectKalpa, we are committed to collaborate with local communities to protect Bali’s Cultural Heritage through local values and perspectives.",
  programs: "ProjectKalpa is a non-profit organization established in 2014, which aims to promote the importance and awareness of cultural and natural heritage.",
  website: "projectkalpa.org"
 )
project_kalpa.save!

toasty_boy = User.new(
  email: 'toastyboy@gmail.com',
  password: 'bunky123',
  ngo: false,
  facebook_picture_url: ("http://ling.bu.edu/uploads/person/image/2688/wc.png?1496957069"),
  first_name: 'Alexander',
  last_name: 'Clapp'
)
toasty_boy.save!

backpacking_couple = User.new(
  email: 'backpackingcouple@gmail.com',
  password:'bunky123',
  ngo: false,
  facebook_picture_url: ("https://cdn-images-1.medium.com/max/1200/0*Vo_gUNHEIe3X2sHQ.jpg"),
  first_name: 'Mira',
  last_name: 'Brock'
)

backpacking_couple.save!



bali_fund_one = Fund.new( user: project_kalpa,   funding_goal: 80000000,   title:
"Community Center for Farmers and Youth",   about: "The Subak Landscape   of
Catur Angga Batukaru has no central meeting place for farmers and no center
for youth to come together for learning and socializing. In efforts to improve
the livelihoods of the families living in the community, we are constructing a
community center.",   use_of_funds: "Roughly half of the funds will go towards
to   sourcing the land, whether leasing it from a farmer or purchasing it. The
other   will go towards the raw materials needed to build the structure and put
basic   interior design. The labor and the organization of the community center
can be   done on a voluntary basis." )



bali_photos_one = [ seed_image('Piling Cover'), seed_image('Piling 1'), seed_image('Piling 2'), seed_image('Piling 3'), seed_image('Piling 4') ]

bali_experience_one = Experience.new(   user: project_kalpa,   title:
"Live in the Quaint Village of Piling with Pak Ketut",   price: 2000000,   capacity: 5,   status: true,
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

  bali_experience_one.features << [ features[0], features[4], features[6], features[7] ]
  bali_experience_one.activities << [ activities[2], activities[3], activities[1], activities[0] ]
  bali_experience_one.areatypes << [ areatypes[0] ]
  bali_experience_one.photo_urls = bali_photos_one
  bali_experience_one.save!



bali_photos_three = [ seed_image('Jatiluwih Cover'), seed_image('Jatiluwih 3'), seed_image('Jatiluwih 4'), seed_image('Jatluwih 1'), seed_image('Jatiluwih 2') ]


bali_experience_three = Experience.new(   user: project_kalpa,   title: "Live in Beautiful Jatiluwih with Pak Nyoman",   price: 2000000,   capacity: 5,   status: true,
address: "Jl. Batu Mejan No. 88",   latitude: -8.371517,   longitude: 115.131846,
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

  bali_experience_three.features << [ features[0], features[4], features[6], features[7] ]
  bali_experience_three.activities << [ activities[2], activities[3], activities[1], activities[0] ]
  bali_experience_three.areatypes << [ areatypes[0] ]
  bali_experience_three.photo_urls = bali_photos_three
  bali_experience_three.save!

bali_photos_two = [ seed_image('Tengkudak-Host-1-862x575'), seed_image('L1830689'), seed_image('tengkudak-accommodation'), seed_image('L1840124-1184x662'), seed_image('tengkudak-kitchen') ]

bali_experience_two = Experience.new( user: project_kalpa,   title: "Live in the historical Tengkudak with Nyoman Sutiani",
price: 1500000,   capacity: 5,   status: true,
address: "Jl. Batu Mejan No. 88",   latitude: -8.417752,   longitude: 115.117740,
long_description: "Nyoman Sutiani and her two brothers are based
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

bali_experience_two.features << [ features[0], features[4], features[6], features[7] ]
bali_experience_two.activities << [ activities[2], activities[3], activities[1], activities[0] ]
bali_experience_two.areatypes << [ areatypes[0] ]
bali_experience_two.photo_urls = bali_photos_two
bali_experience_two.save!
