class CreateMesures < ActiveRecord::Migration[7.1]
  def change
    create_table :mesures do |t|
      t.string :title
      t.text :content
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.string :status
      t.float :latitude
      t.float :longitude
      t.float :area

      t.timestamps
    end
  end
end
