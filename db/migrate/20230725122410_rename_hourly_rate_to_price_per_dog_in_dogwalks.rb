class RenameHourlyRateToPricePerDogInDogwalks < ActiveRecord::Migration[7.0]
  def change
    rename_column :dogwalks, :hourly_rate, :price_per_dog
  end
end
