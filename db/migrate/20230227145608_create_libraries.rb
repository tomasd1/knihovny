class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :nazev
      t.integer :ico, limit: 8
      t.string :ulice
      t.integer :cislo_domovni, limit: 5
      t.integer :psc, limit: 5
      t.decimal :x, precision: 7, scale: 4
      t.decimal :y, precision: 7, scale: 4
      # t.belongs_to :region, null: false, foreign_key: true
      # t.belongs_to :district, null: false, foreign_key: true
      # t.belongs_to :orp, null: false, foreign_key: true
      # t.belongs_to :city, null: false, foreign_key: true
      t.references :region, null: false#, foreign_key: true
      t.references :district, null: false#, foreign_key: true
      t.references :orp, null: false#, foreign_key: true
      t.references :city, null: false#, foreign_key: true

      t.timestamps
    end

    rename_column :libraries, :city_id, :lib_city
    add_foreign_key :libraries, :cities, column: 'lib_city', primary_key: 'kod_obce'

    rename_column :libraries, :region_id, :lib_region
    add_foreign_key :libraries, :regions, column: 'lib_region', primary_key: 'kod_vusc'

    rename_column :libraries, :district_id, :lib_district
    add_foreign_key :libraries, :districts, column: 'lib_district', primary_key: 'kod_okresu'

    rename_column :libraries, :orp_id, :lib_orp
    add_foreign_key :libraries, :orps, column: 'lib_orp', primary_key: 'kod_orp'

  end
end
