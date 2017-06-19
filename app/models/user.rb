class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :artworks
  has_many :user_venues
  has_many :appointments, through: :artworks
  has_many :venues, through: :user_venues

end
