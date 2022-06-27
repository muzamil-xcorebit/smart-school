class ChildPod < ApplicationRecord
  enum status: { Active: 'active', Pending: 'pending', Rejected: 'rejected', Inactive: 'inactive' }
  belongs_to :child
  belongs_to :pod

end
