class Venue < ApplicationRecord
  has_many :walls
  has_many :messages
  has_many :appointments
  has_many :admins, through: :user_venues, class_name:'User', foreign_key:'user_id'
  has_many :user_venues
end
