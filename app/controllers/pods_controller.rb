class PodsController < ApplicationController
  before_action :set_pod, only: %i[show edit update destroy]

  def index
    @pods = Pod.all
  end

  def new
    @pod = Pod.new
    @pod.build_picture
    @pod.build_address
  end

  def show
  end

  def edit
  end

  def create
    @pod = Pod.new(pod_params)
    if @pod.save
      redirect_to @pod
    else
      render'new'
    end
  end

  def update
    if @pod.update(pod_params)
      redirect_to @pod
    else
      render'edit'
    end
  end

  def destroy
    @pod.destroy
    redirect_to pods_path(@pods)
  end

  private

  def set_pod
    @pod = Pod.find(params[:id])
  end

  def pod_params
    params.require(:pod).permit(:name, :phone_number, picture_attributes: [:id, :image],
      address_attributes:[:id, :street, :city, :state, :zipcode, :country])
  end

end
