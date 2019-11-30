require 'rails_helper'

RSpec.describe User, type: :model do
  it "nameが空ならバリデーションが通らない" do
    user = User.new(user_name: '', email: '失敗テスト', password: "111111", password_confirmation: "111111")
    expect(user).not_to be_valid
  end

  it "emaolが空ならバリデーションが通らない" do
    user = User.new(user_name: '失敗テスト', email: '', password: "111111", password_confirmation: "111111")
    expect(user).not_to be_valid
  end

  it "passwordが空ならバリデーションが通らない" do
    user = User.new(user_name: '失敗テスト', email: 'test_user1@gmail.com', password: "", password_confirmation: "")
    expect(user).not_to be_valid
  end


  it "nameとemailとpasswordに内容が記載されていればバリデーションが通る" do
    user = User.new(user_name: '成功テスト', email: 'test_user1@gmail.com', password: "111111", password_confirmation: "111111")
    expect(user).to be_valid
  end

end
