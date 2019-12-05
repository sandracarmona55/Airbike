class AddDefaultStatusBooking < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :status, :boolean, default: false
  end
end
