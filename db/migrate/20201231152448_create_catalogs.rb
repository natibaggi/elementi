class CreateCatalogs < ActiveRecord::Migration[6.1]
  def change
    create_table :catalogs do |t|
      t.string :name
      t.string :status
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
