class ChangeDescriptionToText < ActiveRecord::Migration[6.1]
  def change
    change_column :travel_destinations, :description, :text
  end
end
