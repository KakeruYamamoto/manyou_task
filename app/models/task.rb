# frozen_string_literal: true

class Task < ApplicationRecord
  validates :task_name, presence: true
  validates :task_content, presence: true
  enum priority: %i[高 中 低]
  belongs_to :user
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
end
