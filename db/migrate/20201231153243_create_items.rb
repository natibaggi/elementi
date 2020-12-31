class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.float :price
      t.string :description
      t.string :status
      t.references :catalog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
