class CategoryTransact < ApplicationRecord
  belongs_to :transact
  belongs_to :category
end
