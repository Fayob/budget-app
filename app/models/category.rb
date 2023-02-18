class Category < ApplicationRecord
  belongs_to :user
  has_many :category_transacts, dependent: :delete_all
  has_many :transacts, through: :category_transacts, dependent: :delete_all

  validates :name, presence: true
  validates :icon, presence: true
end
