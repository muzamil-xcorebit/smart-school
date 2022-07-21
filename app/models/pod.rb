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

  before_validation do |pod|
    pod.grades.reject!(&:blank?) if pod.grades
  end

  enum status: { pending: 1,
                 active: 2,
                 rejected: 3,
                 inactive: 4 }

  def self.search_by(search_term)
    joins(:address).where("addresses.street LIKE :search_term OR addresses.city LIKE :search_term
      OR addresses.state LIKE :search_term OR addresses.zipcode LIKE :search_term
      OR addresses.country LIKE :search_term OR name LIKE :search_term
      OR array_to_string(grades, ',') LIKE :search_term", search_term: "%#{ search_term }%")
  end

end
