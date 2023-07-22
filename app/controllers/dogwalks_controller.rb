class DogwalksController < ApplicationController
  before_action :set_dogwalks, only: [:show]
  # Zhan section
  # dogwalks GET    /dogwalks(.:format)                                                                               dogwalks#index

  # dogwalk GET    /dogwalks/:id(.:format)                                                                           dogwalks#show
  def show
    @dogwalk = set_dogwalks
    @booking = Booking.new
  end

  # new_dogwalk GET    /dogwalks/new(.:format)                                                                           dogwalks#new
  # POST   /dogwalks(.:format)                                                                               dogwalks#create
  private

  def set_dogwalks
    @dogwalk = Dogwalk.find(params[:id])
  end
end
