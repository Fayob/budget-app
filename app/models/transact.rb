class Transact < ApplicationRecord
  belongs_to :user
  has_many :category_transacts
  has_many :categories, through: :category_transacts

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_numeric: true, greater_than_or_equal_to: 0 }
end
