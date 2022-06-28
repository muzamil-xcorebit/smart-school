class Teacher < ApplicationRecord
  belongs_to :pod

  validates :name, :phone_number, presence: true
  validates :phone_number, uniqueness: true
end
