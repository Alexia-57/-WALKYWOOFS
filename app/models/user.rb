class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_one :dogwalk
  has_many :bookings_as_walker, through: :dogwalk, source: :bookings

  # does devices validate for us already???
  # Validation for email, ensuring it is present, unique, and in a valid format
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Validation for encrypted_password, ensuring it is present
  validates :encrypted_password, presence: true

  # Validation for reset_password_token, ensuring it is unique
  validates :reset_password_token, uniqueness: true, allow_blank: true

  # Validation for nickname, ensuring it is present and not empty
  validates :nickname, presence: true

  # Validation for pet_details, ensuring it is present
  validates :pet_details, presence: true

  # Validation for pickup_spot, ensuring it is present and not empty
  validates :pickup_spot, presence: true
end

# # schema for reference
# create_table "users", force: :cascade do |t|
#   t.string "email", default: "", null: false
#   t.string "encrypted_password", default: "", null: false
#   t.string "reset_password_token"
#   t.datetime "reset_password_sent_at"
#   t.datetime "remember_created_at"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "nickname"
#   t.text "pet_details"
#   t.string "pickup_spot"
#   t.index ["email"], name: "index_users_on_email", unique: true
#   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
# end
