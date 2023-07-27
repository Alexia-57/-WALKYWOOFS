class BookingsController < ApplicationController
  before_action :set_dogwalk, only: [:create]

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.dogwalk = @dogwalk
    # price = @dogwalk.duration.to_i * @dogwalk.hourly_rate.to_i
    # # adjusted the folowing to account for price_per_dog
    price = @dogwalk.duration.to_i * @dogwalk.price_per_dog.to_i
    @booking.total_price = price
    if @booking.save
      redirect_to bookings_path
    else
      redirect_to dogwalk_path(@dogwalk)
    end
  end

  def index
    @user = current_user
    mydogwalk = @user.dogwalk #currently with error
    @created_dogwalks = @user.bookings #array of all bookings created by the user -Zhan-top first 30 lines
    @booked_dogwalks = mydogwalk&.bookings #array of all incoming bookings that we recieve -Chirs-bottom from line 31
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time)
  end

  def set_dogwalk
    @dogwalk = Dogwalk.find(params[:dogwalk_id])
  end
end
