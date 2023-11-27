class CreateSubComments < ActiveRecord::Migration[7.1]
  def change
    create_table :sub_comments do |t|
      t.text :content
      t.references :comment, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
