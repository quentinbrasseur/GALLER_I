class Artwork < ApplicationRecord
  has_attachment :photo
  belongs_to :owner, class_name: 'User', foreign_key:'user_id'
  has_many :appointments, dependent: :destroy
  has_many :venues, through: :appointments

  validates :title, :location, :photo, :category, :height, :width, :depth, :weight, presence: true
  geocoded_by :location
  # after_validation :geocode
  after_validation :geocode, if: :location_changed?
  # after_create :geocode
end
