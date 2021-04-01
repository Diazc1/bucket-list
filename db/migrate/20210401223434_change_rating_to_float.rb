class ChangeRatingToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :travel_destinations, :rating, :float
  end
end
