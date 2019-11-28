FactoryBot.define do
  factory :user_first, class: User do

    user_name { "test_user1" }
    email { "test_user1@gmail.com" }
    password {"test_user1@gmail.com"}
    password_confirmation {"test_user1@gmail.com"}
  end
end
