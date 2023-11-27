class AddingCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :observations, :category
    add_reference :mesures, :category
  end
end
