class Category < ApplicationRecord
  belongs_to :user
  has_many :category_transacts
  has_many :transacts, through: :category_transacts

  validates :name, presence: true
  validates :icon, presence: true
end
