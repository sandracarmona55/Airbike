class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader
  validates :name, length: { maximum: 35 }
end
