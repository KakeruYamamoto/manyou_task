class Task < ApplicationRecord

  belongs_to :user, dependent: :destroy
  enum priority:[ :高, :中, :低]
  validates :task_name, presence: true
  validates :task_content, presence: true
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
end
