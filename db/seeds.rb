# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include RandomData

10.times do
  user = User.create!(

    name:     RandomData.random_name,
    email:    RandomData.random_email,
    password: RandomData.random_sentence
  )

end

users = User.all

50.times do
  Topic.create!(
    title:  RandomData.random_sentence,
    user: users.sample

  )
end
topics = Topic.all



puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
