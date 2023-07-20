class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :dogwalk

  # Validation for user_id and dogwalk_id, ensuring they are present
  validates :user_id, :dogwalk_id, presence: true

  # Validation for start_time, ensuring it is present and in the future
  validates :start_time, presence: true, timeliness: { on_or_after: -> { Time.current } }

  # Validation for total_price, ensuring it is present and a non-negative float value
  validates :total_price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Validation for status, ensuring it is within a specific range of values
  validates :status, inclusion: { in: 0..2 }

  #  validate for uniqueness in user and dogwalks to prevent registering for the same service twice
  validates :user_id, uniqueness: {scope: :dogwalk_id, message: "is already in the list"}
end


# #  schema for reference
# create_table "bookings", force: :cascade do |t|
#   t.bigint "user_id", null: false
#   t.bigint "dogwalk_id", null: false
#   t.datetime "start_time"
#   t.float "total_price"
#   t.integer "status", default: 0
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["dogwalk_id"], name: "index_bookings_on_dogwalk_id"
#   t.index ["user_id"], name: "index_bookings_on_user_id"
