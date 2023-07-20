class Dogwalk < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  # has_many :user, through: :bookings, dependent: :destroy


  # Validation for service_details, ensuring it is present and not empty
  validates :service_details, presence: true

  # Validation for dog_capacity, ensuring it is present and a positive integer
  validates :dog_capacity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # Validation for neighborhood, ensuring it is present and not empty
  validates :neighborhood, presence: true

  # Validation for duration, ensuring it is present and a non-negative float value
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Validation for hourly_rate, ensuring it is present and a non-negative float value
  validates :hourly_rate, presence: true, numericality: { greater_than_or_equal_to: 0 }

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
