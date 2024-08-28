class GroupsController < ApplicationController

  before_action :find_group, only: %i[show edit update destroy]

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    if @group.save
      redirect_to @group, notice: 'Group was successfully created.'
    else
      redirect_to new_group_path, notice: validation_errors
    end
  end

  def update
    if @group.update(group_params)
      redirect_to @group, notice: 'Group was successfully updated.'
    else
      render :edit, notice: validation_errors
    end
  end

  def destroy
    if @group.destroy
      redirect_to groups_path, notice: 'Group was successfully deleted.'
    else
      redirect_to groups_path, notice: 'Group could not be deleted.'
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def find_group
    @group = Group.find_by(id: params[:id])

    redirect_to(groups_path, notice: "Group with id #{params[:id]} was not found.") unless @group
  end

  def validation_errors
    @group.errors.full_messages.join(" | ")
  end

end
