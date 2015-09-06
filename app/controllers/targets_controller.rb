class TargetsController < ApplicationController
  before_action :target_find, only: [:destroy, :edit, :update]

  def index
    @targets = Target.order(created_at: :DESC).where(user_id: current_user.id).page(params[:page]).per(6)
    Target.target_achieve_judge(@targets, current_user.id)
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.create(name: target_params[:name],text: target_params[:text],user_id: current_user.id)
  end

  def destroy
    @target.destroy
    redirect_to action: :index
  end

  def edit
  end

  def update
    @target.update(target_params)
    redirect_to action: :index
  end

  private
  def target_params
    params.require(:target).permit(:name, :text)
  end
  def target_find
    @target = Target.find(params[:id])
  end
end
