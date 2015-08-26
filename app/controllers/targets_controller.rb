class TargetsController < ApplicationController
  def index
    @targets = Target.all
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.create(target_params)
  end

  def destroy
    @target = Target.find(params[:id])
    @target.destroy
  end

  def edit
    @target = Target.find(params[:id])
  end

  def update
    @target = Target.find(params[:id])
    @target.update(target_params)
  end

  private
  def target_params
    params.require(:target).permit(:name, :text)
  end
end
