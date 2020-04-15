# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

50.times do |_n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = 'password'
  User.create!(user_name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

User.create!(user_name: 'admin',
             email: 'admin@gmail.com',
             password: 'admin@gmail.com',
             password_confirmation: 'admin@gmail.com',
             admin: true)

Label.create!(name: 'プライベート')
Label.create!(name: '仕事')
Label.create!(name: '買い物')
Label.create!(name: '勉強')
Label.create!(name: '雑事')
Label.create!(name: '遊び')
