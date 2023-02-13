class User < ApplicationRecord
  has_many :categories, dependent: :delete_all
  has_many :transacts, dependent: :delete_all

  validates :name, presence: true, length: { minimum: 2, maximum: 70 }
end
