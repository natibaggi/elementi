class Company < ApplicationRecord
    has_one :catalog
    has_many(:categories)
end
