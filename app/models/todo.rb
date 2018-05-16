class Todo < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  validates :items, presence: true

end
