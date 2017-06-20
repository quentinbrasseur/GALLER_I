class UserVenue < ApplicationRecord
  belongs_to :employee, class_name: 'User', foreign_key:"user_id"
  belongs_to :venue
  validates :user_id, uniqueness: {scope: :venue_id}
end
