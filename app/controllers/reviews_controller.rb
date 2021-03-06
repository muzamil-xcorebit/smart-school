class ReviewsController < ApplicationController
  before_action :find_pod
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.pod_id = @pod.id
    @review.parent_id = current_parent.id

    respond_to do |format|

    if @review.save
      format.js
    else
      format.js
    end
   end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to pod_path(@pod)
    else
      render 'edit'
    end
  end

  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to pod_path(@pod) }
      format.js
  end
  end

  private

  def review_params
    params.require(:review).permit(:review)
  end

  def find_pod
    @pod = Pod.find(params[:pod_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
