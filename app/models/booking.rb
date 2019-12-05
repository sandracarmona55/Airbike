class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  has_many :reviews
  # STATUS = ["pending", "accepted", "rejected"]
  # validates :status, inclusion: { in: STATUS }

  def accepted?
    status == "accepted" || "rejected"
  end
end
