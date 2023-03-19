# frozen_string_literal: true

class CreateLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :name
      t.integer :ico, limit: 8
      t.string :street
      t.integer :premise, limit: 5
      t.integer :postcode, limit: 5
      t.decimal :x, precision: 7, scale: 4
      t.decimal :y, precision: 7, scale: 4

      t.timestamps
    end

    add_column :libraries, :city_id, :integer, null: false
    add_foreign_key :libraries, :cities, column: :city_id, primary_key: 'code'
    add_index(:libraries, :city_id)

    add_column :libraries, :region_id, :string, null: false, limit: 5
    add_foreign_key :libraries, :regions, column: :region_id, primary_key: 'code'
    add_index(:libraries, :region_id)

    add_column :libraries, :orp_id, :integer, null: false
    add_foreign_key :libraries, :orps, column: :orp_id, primary_key: 'code'
    add_index(:libraries, :orp_id)

    add_column :libraries, :district_id, :string, null: false, limit: 6
    add_foreign_key :libraries, :districts, column: :district_id, primary_key: 'code'
    add_index(:libraries, :district_id)
  end
end
