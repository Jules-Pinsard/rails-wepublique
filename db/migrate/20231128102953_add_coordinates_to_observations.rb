class AddCoordinatesToObservations < ActiveRecord::Migration[7.1]
  def change
    add_column :observations, :latitude, :float
    add_column :observations, :longitude, :float
  end
end
