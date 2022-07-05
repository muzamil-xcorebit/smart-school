class Pod < ApplicationRecord
  has_many :child_pods
  has_many :children, through: :child_pods, dependent: :destroy
  has_many :reviews
  has_one :teacher, dependent: :destroy
  has_one :picture, as: :imageable
  has_one :address, as: :addressable
  accepts_nested_attributes_for :picture
  accepts_nested_attributes_for :address

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true

  enum status: { pending: 1,
                 active: 2,
                 rejected: 3,
                 inactive: 4 }
end
