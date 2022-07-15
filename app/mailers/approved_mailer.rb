class ApprovedMailer < ApplicationMailer

  def approved(child_pod)
    @child = child_pod.child
    mail(to: "#{@child.parent.email}", subject: "Your request to join the pod is Approved")
  end

end
