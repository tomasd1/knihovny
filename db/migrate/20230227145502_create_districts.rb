class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts, id: false do |t|
      t.string :nazev_okresu, null: false
      t.string :kod_okresu, limit: 6, null: false, primary_key: true, unique: true

      t.timestamps
    end
  end
end
