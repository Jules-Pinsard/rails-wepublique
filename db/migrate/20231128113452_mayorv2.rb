class Mayorv2 < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :mayor
    add_column :users, :mayor, :boolean
  end
end
