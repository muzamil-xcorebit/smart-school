class Pod < ApplicationRecord
  has_many :child_pods
  has_many :children, through: :child_pods
  has_many :reviews
  has_one :teacher
  has_many :pictures, as: :imageable
  has_one :address, as: :addressable

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true
end
