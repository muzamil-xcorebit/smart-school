class ChildPodsController < ApplicationController
  after_action :send_email_to_admin, only: [:create]
  def new
    @pod = Pod.find(params[:id])
    @child_pod = ChildPod.new
  end
  def create
    params[:children_ids]&.each do |cid|
      ChildPod.create(child_id: cid, pod_id: params[:child_pod][:pod_id])
    end
    redirect_to pods_path
  end
  def send_email_to_admin
    ChildPodsMailer.with(
      parent: current_parent.email,
      child: params[:children_ids],
      pod: params[:child_pod][:pod_id]
      ).child_pod_created.deliver_later
  end
end
