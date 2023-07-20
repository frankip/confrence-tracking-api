# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'
require 'faker'
require 'open-uri'

images = [
  "https://cdn.pixabay.com/photo/2017/03/28/12/17/chairs-2181994_640.jpg",
  "https://cdn.pixabay.com/photo/2017/03/28/12/11/chairs-2181960_640.jpg",
  "https://cdn.pixabay.com/photo/2017/03/28/12/10/chairs-2181951_640.jpg",
  "https://cdn.pixabay.com/photo/2016/08/16/09/53/international-conference-1597531_640.jpg",
  "https://cdn.pixabay.com/photo/2017/03/28/12/06/chairs-2181919_640.jpg",
  "https://cdn.pixabay.com/photo/2023/05/08/13/24/laptop-7978588_640.jpg",
  "https://cdn.pixabay.com/photo/2023/04/01/13/26/lake-7892215_640.jpg",
  "https://cdn.pixabay.com/photo/2016/02/03/17/38/coffee-break-1177540_640.jpg",
  "https://cdn.pixabay.com/photo/2016/01/18/09/21/conference-room-1146244_640.jpg",
  "https://cdn.pixabay.com/photo/2017/08/06/11/09/interior-2591368_640.jpg",
  "https://cdn.pixabay.com/photo/2019/10/21/10/34/meeting-4565702_640.jpg",
  "https://cdn.pixabay.com/photo/2015/01/08/18/12/meeting-593301_640.jpg"
]

cities = ["Nairobi", "Mombasa", "Kisumu", "Nakuru", "Eldoret", "Naivasha"]

puts "Seeding"

start_date = Date.new(2019, 1, 1)
end_date = Date.new(Date.today.year, 12, 31)

puts "Creating Conferences"
97.times do
    start = (start_date..end_date).to_a.sample.strftime('%Y-%m-%d')
    last = (Date.parse(start) + rand(1..10)).strftime('%Y-%m-%d')
    ref_num = SecureRandom.alphanumeric(10).upcase
    hash = {
      "reference_number": ref_num,
      "ministry_in_charge": "Ministry of #{Faker::Company.name}",
      "number": Faker::PhoneNumber.phone_number_with_country_code,
      "email": Faker::Internet.email,
      "location": "#{Faker::Address.street_address}, #{Faker::Address.secondary_address}" ,
      "date": "#{start} - #{last}",
      "time": "09:30 - 16:30",
      "city": cities.sample,
      "title": Faker::Lorem.sentence.slice(0..-2),
      "description": Faker::Lorem.paragraph(sentence_count: rand(1..4)),
      "issues": (1..rand(1..7)).to_a.map { Faker::Lorem.paragraph sentence_count: rand(1..4) }.join("|"),
      "resolutions": (1..rand(1..7)).to_a.map { Faker::Lorem.paragraph sentence_count: rand(1..4) }.join("|"),
      "recommendations": (1..rand(1..7)).to_a.map { Faker::Lorem.paragraph sentence_count: rand(1..4) }.join("|")
    }

    conf = Conference.create(hash)
    conf.poster.attach(io: URI.open(images.sample), filename: "#{ref_num}.jpg")
end

# confs.map { |c| {"#{c.id}" => c.participants.map { |p| [p.id, p.nationality] } } }

nationalities = ["Turkish Cypriots", "Kenyans", "Kenyans", "Chadians", "Kenyans", "Kenyans", "Norwegians", "Kenyans", "Norwegians", "Kenyans", "Croatians", "Zambians", "Kenyans", "Saudis", "Kenyans", "Finnish Swedish", "Kenyans", "Malagasy", "Kenyans", "Finnish Swedish"]

puts "Creating Participants"
500.times do
  Participant.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.phone_number,
    id_number: Faker::IDNumber.valid,
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    nationality: nationalities.sample
  )
end

puts "Creating Superuser"
User.create({
  name: "Erick Ochieng Obuya",
  email: "erickochieng766@gmail.com",
  password: "password",
  username: "erick",
  is_admin: true
})

cn = Conference.count
pn = Participant.count


puts "Creating Participations"
1000.times do
  Participation.create!(
    participant_id: rand(1..pn),
    conference_id: rand(1..cn)
  )
end

puts "Done seeding"