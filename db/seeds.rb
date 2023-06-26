# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'date'
require 'faker'

images = [
  "/conferences/CONF012/poster.avif",
  "/conferences/CONF011/poster.webp",
  "/conferences/CONF010/poster.webp",
  "/conferences/CONF009/poster.webp",
  "/conferences/CONF001/poster.webp",
  "/conferences/CONF002/poster.webp",
  "/conferences/CONF003/poster.jpeg",
  "/conferences/CONF004/poster.avif",
  "/conferences/CONF005/poster.webp",
  "/conferences/CONF006/poster.avif",
  "/conferences/CONF008/poster.jpeg",
  "/conferences/CONF007/poster.webp"
]

cities = ["Nairobi", "Mombasa", "Kisumu", "Nakuru", "Eldoret", "Naivasha"]

puts "Seeding"

start_date = Date.new(2019, 1, 1)
end_date = Date.new(Date.today.year, 12, 31)



97.times do
    start = (start_date..end_date).to_a.sample.strftime('%Y-%m-%d')
    last = (Date.parse(start) + rand(1..10)).strftime('%Y-%m-%d')
    
    hash = {
      "reference_number": SecureRandom.alphanumeric(10).upcase,
      "ministry_in_charge": "Ministry of #{Faker::Company.name}",
      "number": Faker::PhoneNumber.phone_number_with_country_code,
      "email": Faker::Internet.email,
      "city": cities.sample,
      "location": "#{Faker::Address.street_address}, #{Faker::Address.secondary_address}" ,
      "date": "#{start} - #{last}",
      "time": "09:30 - 16:30",
      "image": images.sample,
      "title": Faker::Lorem.sentence.slice(0..-2),
      "description": Faker::Lorem.paragraph(sentence_count: 10)
    }

    Conference.create(hash)
end

# confs.map { |c| {"#{c.id}" => c.participants.map { |p| [p.id, p.nationality] } } }

nationalities = ["Turkish Cypriots", "Kenyans", "Kenyans", "Chadians", "Kenyans", "Kenyans", "Norwegians", "Kenyans", "Norwegians", "Kenyans", "Croatians", "Zambians", "Kenyans", "Saudis", "Kenyans", "Finnish Swedish", "Kenyans", "Malagasy", "Kenyans", "Finnish Swedish"]

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

User.create({
  name: "Erick Ochieng Obuya",
  email: "erickochieng766@gmail.com",
  password: "password",
  username: "erick",
  is_admin: true
})

cn = Conference.count
pn = Participant.count

1000.times do
  Participation.create!(
    participant_id: rand(1..pn),
    conference_id: rand(1..cn)
  )
end

puts "Done seeding"