class ChildPod < ApplicationRecord
  before_update :send_mail_to_parent
  belongs_to :child
  belongs_to :pod
  enum status: { pending: 1,
                 active: 2,
                 rejected: 3,
                 inactive: 4 }

  private

  def send_mail_to_parent
    if self.status_changed?(from: "pending", to: "active")
      ApprovedMailer.approved(self).deliver_later
    end
    if self.status_changed?(from: "pending", to: "rejected")
      RejectedMailer.rejected(self).deliver_later
    end
  end

end
