class Venue < ApplicationRecord
  has_attachment :photo
  has_many :walls
  has_many :messages, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :employees, through: :user_venues
  # has_many :employees, through: :user_venues, class_name:'User', foreign_key:'user_id'
  has_many :user_venues, dependent: :destroy

  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  def employee?(user)
    self.employees.map(&:id).include?(user.id)
  end
end
