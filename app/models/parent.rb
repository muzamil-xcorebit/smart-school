class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :children, dependent: :destroy
  has_many :reviews
  has_one :picture, as: :imageable
  has_one :address, as: :addressable

  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ , message: "Please enter a valid email address." }
end
