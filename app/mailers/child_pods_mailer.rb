class ChildPodsMailer < ApplicationMailer

  def child_pod_created
    @parent = params[:parent]
    @children = Child.find(params[:child])
    @pod = Pod.find(params[:pod])

    mail to: "admin_smart_school@gmail.com", subject: "Requested to join the pod"
  end
end
