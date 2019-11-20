class Task < ApplicationRecord
  
  def self.search(search)
    return Post.all unless search
    Post.where(['content LIKE ?', "%#{search}%"])
  end
  # belongs_to :user
  # default_scope -> { order(created_at: :desc) }
  validates :task_name, presence: true
  validates :task_content, presence: true

end
