class CreateOrps < ActiveRecord::Migration[7.0]
  def change
    create_table :orps, id: false do |t|
      t.string :name, null: false, limit: 50
      t.integer :code, limit: 4, null: false, primary_key: true, unique: true

      t.timestamps
    end
  end
end
