class BookingsController < ApplicationController
  def create
    @booking = Booking.new(params_booking)
    @bike = Bike.find(params[:bike_id])
    @booking.bike = @bike
    @booking.user = current_user
    @booking.save
    redirect_to index_requests_path
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "accepted"
    redirect_to index_admin_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.update(status: "rejected")
    redirect_to index_admin_path
  end

  def index_admin
    @bikes = current_user.bikes
  end

  def index_requests
    @bookings = Booking.where(user_id: current_user.id)
  end

  private

  def params_booking
    params.require(:booking).permit(:start_date, :end_date)
  end
end
