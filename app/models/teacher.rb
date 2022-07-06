class Teacher < ApplicationRecord
  belongs_to :pod
  has_one :picture, as: :imageable
  has_one :address, as: :addressable
  accepts_nested_attributes_for :picture
  accepts_nested_attributes_for :address

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true
end
