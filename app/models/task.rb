class Task < ApplicationRecord

  
  # belongs_to :user
  # default_scope -> { order(created_at: :desc) }
  enum priority:[ :高, :中, :低]
  validates :task_name, presence: true
  validates :task_content, presence: true

end
