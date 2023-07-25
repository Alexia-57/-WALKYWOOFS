class DogwalksController < ApplicationController
  before_action :set_dogwalks, only: [:show]
  # Zhan section
  # dogwalks GET    /dogwalks(.:format)                                                                               dogwalks#index

  # dogwalk GET    /dogwalks/:id(.:format)                                                                           dogwalks#show
  def show
    # raise
    # @dogwalks = dogwalks.find(params[:id])
  end

  # new_dogwalk GET    /dogwalks/new(.:format)                                                                           dogwalks#new
  # POST   /dogwalks(.:format)                                                                               dogwalks#create

  def new
    @dogwalk = Dogwalk.new
  end

  def create
    @dogwalk = Dogwalk.new(dogwalk_params)
    @dogwalk.save
    redirect_to dogwalks_path
  end

  private

  def set_dogwalks
    @dogwalk = Dogwalk.find(params[:id])
  end

  def dogwalk_params
    params.require(:dogwalk).permit(:service_details, :dog_capacity, :neighborhood, :duration, :hourly_rate)
  end

end
