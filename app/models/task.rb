# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :user
  enum priority: %i[高 中 低]
  validates :task_name, presence: true
  validates :task_content, presence: true
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
end
