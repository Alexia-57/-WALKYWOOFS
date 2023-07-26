class AddDogNumToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :dog_number, :integer
  end
end
