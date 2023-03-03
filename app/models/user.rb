class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :categories, dependent: :delete_all
  has_many :transacts, dependent: :delete_all

  validates :name, presence: true, length: { minimum: 2, maximum: 70 }
  validates :email, uniqueness: { case_sensitive: false }
end
