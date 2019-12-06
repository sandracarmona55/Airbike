class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(params_review)
    @review.booking = @booking
    @review.save
    redirect_to bike_path(@booking.bike_id)
  end

  private

  def params_review
    params.require(:review).permit(:title, :content)
  end
end
