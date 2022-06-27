class Pod < ApplicationRecord
  has_many :child_pods
  has_many :children, through: :child_pods

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true
end
