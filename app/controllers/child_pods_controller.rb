class ChildPodsController < ApplicationController
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
end
