class Todo < ApplicationRecord
  belongs_to :campaign

  validates :items, presence: true

end
