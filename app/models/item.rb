class Item < ApplicationRecord
  belongs_to :catalog
  belongs_to :category

  validates :name, length: { minimum: 3 }
  validates :price, numericality: {greater_than: 0}
    
  validates :description, length: { minimum: 6 }
  validates :status, inclusion: { in: ["active", "inactive"]}

end
