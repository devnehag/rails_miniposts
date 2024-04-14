# Users
User.create!(name: "Neha Gupta",
email: "gupta.neha2004@gmail.com",
password: "password@123",
password_confirmation: "password@123",
admin: true,
activated: true,
activated_at: Time.zone.now)
99.times do |n|
name = Faker::Name.name
email = "rails-#{n+1}@miniposts.com"
password = "password"
User.create!(name: name,
email: email,
password: password,
password_confirmation: password,
activated: true,
activated_at: Time.zone.now)
end
# Microposts
users = User.order(:created_at).take(6)
50.times do
content = Faker::Lorem.sentence(word_count: 5)
users.each { |user| user.microposts.create!(content: content) }
end
# Create following relationships.
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }