class Company < ApplicationRecord
    validates :name, presence: true

    has_one :catalog
    has_many(:categories)
end
