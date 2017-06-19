class Artwork < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key:'user_id'
  has_many :appointments, dependent: :destroy
  has_many :venues, through: :appointments
end
