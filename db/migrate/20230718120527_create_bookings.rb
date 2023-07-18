class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :dogwalk, null: false, foreign_key: true
      t.datetime :start_time
      t.float :total_price
      t.integer :status

      t.timestamps
    end
  end
end
