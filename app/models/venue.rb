class Venue < ApplicationRecord
  has_many :walls
  has_many :messages
  has_many :appointments
  has_many :employees, through: :user_venues, source: :user
  # has_many :employees, through: :user_venues, class_name:'User', foreign_key:'user_id'
  has_many :user_venues

  def employee?(user)
    self.employees.map(&:id).include?(user.id)
  end
end
