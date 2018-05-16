class Campaign < ApplicationRecord
  belongs_to :user
  has_many :todos
  has_many :comments

  validates :title, presence: true
  validates :tags, presence: true
  validates :estimated_duration, presence: true
end



