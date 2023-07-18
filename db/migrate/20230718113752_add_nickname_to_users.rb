class AddNicknameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :nickname, :string
    add_column :users, :pet_details, :text
    add_column :users, :pickup_spot, :string
  end
end
