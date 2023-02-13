class Transact < ApplicationRecord
  belongs_to :user
  has_many :category_transacts

  validates :name, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
