class Todo < ApplicationRecord
  belongs_to :campaign
  belongs_to :user
  has_many :comments

  validates :items, presence: true

end
