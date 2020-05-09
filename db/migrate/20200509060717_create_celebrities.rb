class CreateCelebrities < ActiveRecord::Migration[6.0]
  def change
    create_table :celebrities do |t|
      t.string :name
      t.string :description
      t.integer :price_per_day
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
