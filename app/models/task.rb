class Task < ApplicationRecord
  # belongs_to :user

  validates :task_name, presence: true
  validates :task_content, presence: true
end
