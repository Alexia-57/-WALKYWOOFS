class CreateDogwalks < ActiveRecord::Migration[7.0]
  def change
    create_table :dogwalks do |t|
      t.text :service_details
      t.integer :dog_capacity
      t.string :neighborhood
      t.float :duration
      t.float :hourly_rate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
