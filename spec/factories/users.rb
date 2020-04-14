# frozen_string_literal: true

FactoryBot.define do
  factory :first_user, class: User do
    user_name { 'test_user1' }
    email { 'test_user1@gmail.com' }
    password { 'test_user1@gmail.comtest_user1@gmail.com' }
    password_confirmation { 'test_user1@gmail.comtest_user1@gmail.com' }
    admin { true }
  end
  factory :second_user, class: User do
    user_name { 'test_user2' }
    email { 'test_user2@gmail.com' }
    password { 'test_user2@gmail.comtest_user2@gmail.com' }
    password_confirmation { 'test_user2@gmail.comtest_user2@gmail.com' }
    admin { false }
  end
  factory :third_user, class: User do
    user_name { 'test_user3' }
    email { 'test_user3@gmail.com' }
    password { 'test_user3@gmail.comtest_user3@gmail.com' }
    password_confirmation { 'test_user3@gmail.comtest_user3@gmail.com' }
    admin { false }
  end
end
