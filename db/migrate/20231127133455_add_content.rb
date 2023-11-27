class AddContent < ActiveRecord::Migration[7.1]
  def change
    add_column :sub_comment, :content, :string
  end
end
