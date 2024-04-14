User.create!(name: "Neha Gupta",
email: "gupta.neha2004@gmail.com",
password: "password",
password_confirmation: "password",
admin: true,
activated: true,
activated_at: Time.zone.now)
# Generate a bunch of additional users.
40.times do |n|
name = Faker::Name.name
email = "peace-#{n+1}@miniposts.com"
password = "password"
User.create!(name: name,
email: email,
password: password,
password_confirmation: password,
activated: true,
activated_at: Time.zone.now)
end
# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
content = Faker::Lorem.sentence(word_count: 5)
users.each { |user| user.microposts.create!(content: content) }
end
