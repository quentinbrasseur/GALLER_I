class Appointment < ApplicationRecord
  belongs_to :artwork
  belongs_to :venue
end
