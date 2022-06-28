class Teacher < ApplicationRecord
  belongs_to :pod
  has_one :picture, as: :imageable
  has_one :address, as: :addressable

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true
end
