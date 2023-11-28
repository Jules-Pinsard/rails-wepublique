class AddCodeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :code, :string
  end
end
