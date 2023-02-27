class CreateOrps < ActiveRecord::Migration[7.0]
  def change
    create_table :orps, id: false do |t|
      t.string :nazev_orp, null: false
      t.integer :kod_orp, limit: 4, null: false, primary_key: true, unique: true

      t.timestamps
    end
  end
end
