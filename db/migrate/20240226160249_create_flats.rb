class CreateFlats < ActiveRecord::Migration[7.1]
  def change
    create_table :flats do |t|
      t.string :name
      t.string :adress
      t.integer :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
