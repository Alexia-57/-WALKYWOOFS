class Dogwalk < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  # has_many :user, through: :bookings, dependent: :destroy

  # include pg gem search function in model
  include PgSearch::Model

  # include the following and search by this method name
  #  name the method anything we want like super_duper_search
  pg_search_scope :search_by_neighborhood_and_service_details_and_price_per_dog_and_dogwalker,
    # tell pg search whcih columns to look into
    against: [ :neighborhood, :service_details, :price_per_dog ],
    # filter dogwalks via association between user and dogwalk
    # here we are adding ability to search based on dogwalker name
    associated_against: {
      user: [ :nickname ]
    },
    using: {
      # searches for it even if it is half a word
      tsearch: { prefix: true } # <-- now `superman batm` will return something!
    }


  # Validation for service_details, ensuring it is present and not empty
  validates :service_details, presence: true

  # Validation for dog_capacity, ensuring it is present and a positive integer
  validates :dog_capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Validation for neighborhood, ensuring it is present and not empty
  validates :neighborhood, presence: true

  # Validation for duration, ensuring it is present and a non-negative float value
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Validation for price_per_dog, ensuring it is present and a non-negative float value
  validates :price_per_dog, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Validation for user_id, ensuring it is present
  validates :user_id, presence: true

end

# # schema reference
# create_table "dogwalks", force: :cascade do |t|
#   t.text "service_details"
#   t.integer "dog_capacity"
#   t.string "neighborhood"
#   t.float "duration"
#   t.float "hourly_rate"
#   t.bigint "user_id", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_dogwalks_on_user_id"
# end
