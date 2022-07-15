class RejectedMailer < ApplicationMailer

  def rejected(child_pod)
    @child = child_pod.child
    mail(to: "#{@child.parent.email}", subject: "Your request to join the pod is Rejected")
  end

end
