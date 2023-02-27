class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities, id: false do |t|
      t.string :nazev_obce, null: false
      t.integer :kod_obce, limit: 6, null: false, primary_key: true, unique: true

      t.timestamps
    end
  end
end
