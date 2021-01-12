class Category < ApplicationRecord
    belongs_to(:company)
    has_many :items

    validates :name, length: { minimum: 3 }

    validates :status, inclusion: { in: ["active", "inactive"]}


end
