class CreateTravelDestinations < ActiveRecord::Migration[6.1]
  def change
    create_table :travel_destinations do |t|
      t.string :location
      t.string :description
      t.decimal :rating
      t.integer :user_id
    end
  end
end
