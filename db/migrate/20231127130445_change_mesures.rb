class ChangeMesures < ActiveRecord::Migration[7.1]
  def change
    remove_column :mesures, :latitude
    remove_column :mesures, :longitude
    remove_column :mesures, :area
    remove_column :mesures, :location
  end
end
