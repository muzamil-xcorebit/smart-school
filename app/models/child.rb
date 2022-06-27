class Child < ApplicationRecord

  belongs_to :parent
  has_many :child_pods
  has_many :pods, through: :child_pods
  validates :name, presence: true

  has_many :active_pods, -> { where(child_pods: { status: 'Active' }) }, through: :child_pods, source: :pod
  has_many :pending_pods, -> { where(child_pods: { status: 'Pending' }) }, through: :child_pods, source: :pod
  has_many :rejected_pods, -> { where(child_pods: { status: 'Rejected' }) }, through: :child_pods, source: :pod
  has_many :inactive_pods, -> { where(child_pods: { status: 'Inactive' }) }, through: :child_pods, source: :pod
  scope :active_pod, -> { active_pods.last }
end
