class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :children, dependent: :destroy
  has_many :reviews
  has_one :picture, as: :imageable
  has_one :address, as: :addressable

  validates :name, presence: true
  validates :email,:phone_number, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ , message: "Please enter a valid email address." }
end
