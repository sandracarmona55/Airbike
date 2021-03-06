class Bike < ApplicationRecord
  belongs_to :user
  has_many :bookings
  mount_uploader :photo, PhotoUploader
  validates :name, length: { maximum: 35 }, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :photo, presence: true
  validates :category, presence: true
  validates :price, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
