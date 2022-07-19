class ChildrenController < ApplicationController
  before_action :set_parent, only: %i[index create new]
  before_action :set_child, only: %i[show edit update destroy]

  def index
    @children = @parent.children
  end

  def new
    @child = @parent.children.build
    @child.build_picture
    @child.build_address
  end

  def show
  end

  def edit
  end

  def create
    @child = @parent.children.build(child_params)
    if @child.save
      redirect_to parent_children_path
    else
      render'new'
    end
  end

  def update
    if @child.update(child_params)
      redirect_to @child
    else
      render'edit'
    end
  end

  def destroy
    @child.destroy
    redirect_to parent_children_path([current_parent, @child])
  end

  private

  def set_parent
    @parent = Parent.find(params[:parent_id])
  end

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.require(:child).permit(:name, :age, :grades, picture_attributes: [:id, :image],
    address_attributes:[:id, :street, :city, :state, :zipcode, :country])
  end

end
