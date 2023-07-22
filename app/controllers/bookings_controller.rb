class BookingsController < ApplicationController
  before_action :set_dogwalk, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dogwalk = @dogwalk
    price = @dogwalk.duration.to_i * @dogwalk.hourly_rate.to_i
    @booking.total_price = price
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to dogwalk_path(@dogwalk)
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time)
  end

  def set_dogwalk
    @dogwalk = Dogwalk.find(params[:dogwalk_id])
  end
end
