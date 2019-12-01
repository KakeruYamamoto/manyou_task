# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


50.times do |n|

name = Faker::Name.name
email = Faker::Internet.email
priority = ["高", "中", "低"]
status = ['未着手','着手中','完了']
s1 = Date.parse("2015/01/01")
s2 = Date.parse("2024/01/01")
s = Random.rand(s1 .. s2)


email = Faker::Internet.email
password = "password"
User.create!(user_name: name,
             email: email,
             password: password,
             password_confirmation: password,
             )
end
User.create!(user_name: "admin",
            email: "admin@gmail.com",
            password: "admin@gmail.com",
            password_confirmation: "admin@gmail.com",
            admin: true
            )
