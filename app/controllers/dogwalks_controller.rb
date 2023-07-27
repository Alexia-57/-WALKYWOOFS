class DogwalksController < ApplicationController
  before_action :set_dogwalks, only: [:show]

  # dogwalks GET    /dogwalks(.:format)                                                                               dogwalks#index

  def index
    if params[:query].present?
      @dogwalks = Dogwalk.search_by_keyword(params[:query])
    else
      @dogwalks = Dogwalk.all
    end
  end
  # dogwalk GET    /dogwalks/:id(.:format)                                                                           dogwalks#show
  def show
    @dogwalk = set_dogwalks
    @booking = Booking.new
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


# t.text "service_details"
#     t.integer "dog_capacity"
#     t.string "neighborhood"
#     t.float "duration"
#     t.float "hourly_rate"
#     t.bigint "user_id", null: false
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.index ["user_id"], name: "index_dogwalks_on_user_id"
