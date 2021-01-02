class AddCategoryToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :category, null: false, foreign_key: true
    add_reference :items, :company, null: false, foreign_key: true
  end
end
