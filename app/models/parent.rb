class Parent < ApplicationRecord
  has_many :children, dependent: :destroy
  has_many :reviews
  has_one :picture, as: :imageable
  has_one :address, as: :addressable

  validates :name, :phone_number, presence: true
  validates :email,:phone_number, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ , message: "Please enter a valid email address." }
end
