class Campaign < ApplicationRecord
  belongs_to :user
  has_many :todos

  validates :title, presence: true
  validates :tags, presence: true
  validates :estimated_duration, presence: true
end



