User.create!(name: "Adly Magdy",
             email: "adly.tadros@yahoo.com",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)
99.times do |n|
  name =  Faker::Name.name
  email = "example-#{n+1}@example.com"
  password = 'foobar'
  User.create!(name: name,
             email: email,
             password:              password,
             password_confirmation: password,
             activated: true,
             activated_at: Time.zone.now)
end