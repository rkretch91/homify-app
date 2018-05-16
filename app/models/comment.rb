class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :campaign, optional: true
  belongs_to :todo, optional: true

  validates :title, presence: true
end
