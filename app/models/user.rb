class User < ApplicationRecord
  has_many :tasks
  validates :user_name, presence: true, length: { maximum: 30 }
  validates :email,presence: true, length: { maximum: 255 }, uniqueness: true,
                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { minimum: 6 }
  before_validation { email.downcase! }
  has_secure_password

  before_destroy :user_should_have_at_least_one

    private

    def user_should_have_at_least_one
      if User.where(admin:true).count == 1
      errors.add :base, '少なくとも1つ、管理用のアカウントが必要です'
      throw :abort
      end
    end
end
