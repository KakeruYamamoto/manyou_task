FactoryBot.define do
  factory :user do
    user_name { "MyString" }
    email { "MyString" }
    password_digest { "MyString" }
    admin { false }
  end
end
