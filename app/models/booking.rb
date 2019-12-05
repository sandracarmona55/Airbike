class Booking < ApplicationRecord
  belongs_to :bike
  belongs_to :user
  has_many :reviews
  # STATUS = ["pending", "accepted", "rejected"]
  # validates :status, inclusion: { in: STATUS }

  def accepted?
    status == "accepted" || "rejected"
  end

  def total_price(start_date, end_date, price)
    price * (end_date - start_date).to_i
  end
end
