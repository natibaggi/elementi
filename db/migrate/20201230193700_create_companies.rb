class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :cnpj
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
