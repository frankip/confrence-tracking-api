# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

conferences =  [
    {
      "reference_number": "CONF001",
      "ministry_in_charge": "Ministry of Education",
      "number": "123456789",
      "email": "conference@example.com",
      "location": "City Convention Center",
      "time": "09:00 - 17:00",
      "date": "2023-06-15 - 2023-06-15",
      "image": "/conferences/CONF001/poster.webp",
      "title": "Education Conference",
      "description": "This conference aims to bring together educators, researchers, and industry professionals to discuss the future of education and explore innovative teaching methods. Join us for a day of insightful sessions, engaging discussions, and networking opportunities."
    },
    {
      "reference_number": "CONF002",
      "ministry_in_charge": "Ministry of Health",
      "number": "987654321",
      "email": "conference@example.com",
      "location": "Healthcare Conference Center",
      "time": "10:00 - 18:00",
      "date": "2023-07-05 - 2023-06-15",
      "image": "/conferences/CONF002/poster.webp",
      "title": "Healthcare Conference",
      "description": "Join us at the Healthcare Conference to learn about the latest advancements in healthcare and medical research. Leading experts in the field will share their knowledge and insights through keynote presentations, panel discussions, and interactive workshops. This is an excellent opportunity to network with healthcare professionals and stay updated on the latest industry trends."
    },
    {
      "reference_number": "CONF003",
      "ministry_in_charge": "Ministry of Technology",
      "number": "555555555",
      "email": "conference@example.com",
      "location": "Tech Expo Center",
      "time": "09:30 - 16:30",
      "date": "2023-08-20 - 2023-06-15",
      "image": "/conferences/CONF003/poster.jpeg",
      "title": "Technology Conference",
      "description": "Discover the future of technology at our Technology Conference. Join us for a day of captivating presentations, hands-on workshops, and live demonstrations on topics such as artificial intelligence, blockchain, virtual reality, and more. Engage with industry experts, connect with fellow technology enthusiasts, and gain valuable insights into the latest trends and innovations."
    },
    {
      "reference_number": "CONF004",
      "ministry_in_charge": "Ministry of Finance",
      "number": "999999999",
      "email": "conference@example.com",
      "location": "Finance Summit Hall",
      "time": "08:00 - 18:00",
      "date": "2023-09-10 - 2023-06-15",
      "image": "/conferences/CONF004/poster.avif",
      "title": "Finance Summit",
      "description": "The Finance Summit brings together finance experts, industry leaders, and aspiring professionals to discuss economic trends, financial strategies, and investment opportunities. Attend keynote speeches by renowned economists, participate in interactive workshops, and network with professionals from various sectors of the finance industry. Don't miss this chance to gain valuable insights and stay ahead in the ever-changing world of finance."
    },
    {
      "reference_number": "CONF005",
      "ministry_in_charge": "Ministry of Education",
      "number": "123456789",
      "email": "conference@example.com",
      "location": "City Convention Center",
      "time": "09:00 - 17:00",
      "date": "2023-06-15 - 2023-06-15",
      "image": "/conferences/CONF005/poster.webp",
      "title": "Education Conference",
      "description": "This conference aims to bring together educators, researchers, and industry professionals to discuss the future of education and explore innovative teaching methods. Join us for a day of insightful sessions, engaging discussions, and networking opportunities."
    },
    {
      "reference_number": "CONF006",
      "ministry_in_charge": "Ministry of Health",
      "number": "987654321",
      "email": "conference@example.com",
      "location": "Healthcare Conference Center",
      "time": "10:00 - 18:00",
      "date": "2023-07-05 - 2023-06-15",
      "image": "/conferences/CONF006/poster.avif",
      "title": "Healthcare Conference",
      "description": "Join us at the Healthcare Conference to learn about the latest advancements in healthcare and medical research. Leading experts in the field will share their knowledge and insights through keynote presentations, panel discussions, and interactive workshops. This is an excellent opportunity to network with healthcare professionals and stay updated on the latest industry trends."
    },
    {
      "reference_number": "CONF007",
      "ministry_in_charge": "Ministry of Technology",
      "number": "555555555",
      "email": "conference@example.com",
      "location": "Tech Expo Center",
      "time": "09:30 - 16:30",
      "date": "2023-08-20 - 2023-06-15",
      "image": "/conferences/CONF007/poster.webp",
      "title": "Technology Conference",
      "description": "Discover the future of technology at our Technology Conference. Join us for a day of captivating presentations, hands-on workshops, and live demonstrations on topics such as artificial intelligence, blockchain, virtual reality, and more. Engage with industry experts, connect with fellow technology enthusiasts, and gain valuable insights into the latest trends and innovations."
    },
    {
      "reference_number": "CONF008",
      "ministry_in_charge": "Ministry of Finance",
      "number": "999999999",
      "email": "conference@example.com",
      "location": "Finance Summit Hall",
      "time": "08:00 - 18:00",
      "date": "2023-09-10 - 2023-06-15",
      "image": "/conferences/CONF008/poster.jpeg",
      "title": "Finance Summit",
      "description": "The Finance Summit is a premier event for finance professionals, investors, and entrepreneurs. This summit provides a platform for networking, knowledge sharing, and exploring investment opportunities. Join us for insightful keynote speeches, panel discussions, and interactive sessions led by industry experts. Stay ahead of the curve with the latest trends and developments in finance."
    },
    {
      "reference_number": "CONF009",
      "ministry_in_charge": "Ministry of Education",
      "number": "123456789",
      "email": "conference@example.com",
      "location": "City Convention Center",
      "time": "09:00 - 17:00",
      "date": "2023-06-15 - 2023-06-15",
      "image": "/conferences/CONF009/poster.webp",
      "title": "Education Conference",
      "description": "Join us at the Education Conference, where educators, researchers, and policymakers come together to shape the future of education. Explore innovative teaching methods, share best practices, and engage in thought-provoking discussions on topics such as personalized learning, educational technology, and inclusive education. Connect with like-minded professionals and gain inspiration to transform education."
    },
    {
      "reference_number": "CONF010",
      "ministry_in_charge": "Ministry of Health",
      "number": "987654321",
      "email": "conference@example.com",
      "location": "Healthcare Conference Center",
      "time": "10:00 - 18:00",
      "date": "2023-07-05 - 2023-06-15",
      "image": "/conferences/CONF010/poster.webp",
      "title": "Healthcare Conference",
      "description": "The Healthcare Conference is a must-attend event for healthcare professionals, researchers, and policymakers. Explore the latest advancements in healthcare, from cutting-edge treatments to groundbreaking research. Engage in interactive sessions, join panel discussions, and network with experts in the field. Stay up-to-date with the evolving landscape of healthcare and contribute to shaping its future."
    },
    {
      "reference_number": "CONF011",
      "ministry_in_charge": "Ministry of Technology",
      "number": "555555555",
      "email": "conference@example.com",
      "location": "Tech Expo Center",
      "time": "09:30 - 16:30",
      "date": "2023-08-20 - 2023-06-15",
      "image": "/conferences/CONF011/poster.webp",
      "title": "Technology Conference",
      "description": "Immerse yourself in the world of technology at the Technology Conference. Experience captivating presentations, hands-on workshops, and live demonstrations on emerging technologies such as artificial intelligence, machine learning, and Internet of Things (IoT). Engage with thought leaders, connect with fellow enthusiasts, and gain valuable insights into the future of technology."
    },
    {
      "reference_number": "CONF012",
      "ministry_in_charge": "Ministry of Finance",
      "number": "999999999",
      "email": "conference@example.com",
      "location": "Finance Summit Hall",
      "time": "08:00 - 18:00",
      "date": "2023-09-10 - 2023-06-15",
      "image": "/conferences/CONF012/poster.avif",
      "title": "Finance Summit",
      "description": "The Finance Summit is a premier event for finance professionals, investors, and entrepreneurs. This summit provides a platform for networking, knowledge sharing, and exploring investment opportunities. Join us for insightful keynote speeches, panel discussions, and interactive sessions led by industry experts. Stay ahead of the curve with the latest trends and developments in finance."
    }
]

puts "Seeding"

conferences.each do |hash|
    Conference.create(hash)
end

User.create({
  name: "Erick Ochieng Obuya",
  email: "erickochieng766@gmail.com",
  password: "password"
})

puts "Done seeding"