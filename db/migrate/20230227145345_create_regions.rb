class CreateRegions < ActiveRecord::Migration[7.0]
  def change
    create_table :regions, id: false do |t|
      t.string :name, null: false
      t.string :code, limit: 5, null: false, primary_key: true, unique: true

      t.timestamps
    end
  end
end
