class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_create :set_default_expertise
  has_many :campaigns
  has_many :todos
  # or
  # before_validation :set_default_role

  private
  def set_default_expertise
    self.expertise ||= :novice
  end
end
