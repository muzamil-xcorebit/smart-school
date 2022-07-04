class Child < ApplicationRecord

  belongs_to :parent
  has_many :child_pods
  has_many :pods, through: :child_pods
  has_one :picture, as: :imageable
  has_one :address, as: :addressable
  accepts_nested_attributes_for :picture
  accepts_nested_attributes_for :address

  validates :name, presence: true

  has_many :pending_pods, ->  { where(child_pods: { status: 'pending'  }) }, through: :child_pods, source: :pod
  has_many :active_pods, ->   { where(child_pods: { status: 'active'   }) }, through: :child_pods, source: :pod
  has_many :rejected_pods, -> { where(child_pods: { status: 'rejected' }) }, through: :child_pods, source: :pod
  has_many :inactive_pods, -> { where(child_pods: { status: 'inactive' }) }, through: :child_pods, source: :pod
  scope :active_pod, -> { active_pods.last }
end
