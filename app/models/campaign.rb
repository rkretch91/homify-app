class Campaign < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :tags, presence: true
  validates :estimated_duration, presence: true
end



