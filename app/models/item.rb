class Item < ApplicationRecord
  belongs_to :catalog
  belongs_to :category
end
