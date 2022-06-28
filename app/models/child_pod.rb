class ChildPod < ApplicationRecord
  belongs_to :child
  belongs_to :pod
  enum status: { pending: 1,
                 active: 2,
                 rejected: 3,
                 inactive: 4 }
end
