class Task < ApplicationRecord

  belongs_to :user, dependent: :destroy
  enum priority:[ :高, :中, :低]
  validates :task_name, presence: true
  validates :task_content, presence: true

end
