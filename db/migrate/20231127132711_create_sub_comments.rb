class CreateSubComments < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_comments do |t|
      t.integer :user_id
      t.integer :comment_id

      t.timestamps
    end
  end
end
