require 'faker'

# sample_image = Restaurant.find(2)
#
# 10.times do
#   Restaurant.create!(
#     name: Faker::Company.name,
#     address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.state_abbr} #{Faker::Number.number(5)}",
#     phone: '555-555-5555',
#     website: Faker::Internet.url,
#     image: sample_image.image
#   )
# end

restaurants = Restaurant.all

50.times do
  Review.create!(
    restaurant_id: restaurants.sample.id,
    rating: Faker::Number.between(1, 5),
    comment: Faker::Lorem.paragraph
  )
end

puts "Seed Finished"
