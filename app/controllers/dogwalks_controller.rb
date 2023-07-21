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
  private

  def set_dogwalks
    @dogwalks = Dogwalks.find(params[:id])
  end

end
