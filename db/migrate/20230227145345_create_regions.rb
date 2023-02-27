class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions, id: false do |t|
      t.string :nazev_vusc, null: false
      t.string :kod_vusc, limit: 5, null: false, primary_key: true, unique: true

      t.timestamps
    end
  end
end
