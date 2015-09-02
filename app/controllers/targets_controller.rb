class TargetsController < ApplicationController
  def index
    @targets = Target.order(created_at: :DESC).where(user_id: current_user.id).page(params[:page]).per(6)

    # if @targets.length != 0
    #   @targets.each do |target|
    #     if target.todos.achieve == true
    #       target_todos_achieves << 1
    #     end
    #   end
    #   if target_todos_achieves.length > 0
    #     @targets.each do |target|
    #       target.achieve = false
    #     end
    #     @targets.save
    #   end
    # end
  end

  def new
    @target = Target.new
  end

  def create
    @target = Target.create(name: target_params[:name],text: target_params[:text],user_id: current_user.id)
  end

  def destroy
    @target = Target.find(params[:id])
    @target.destroy
    redirect_to action: :index
  end

  def edit
    @target = Target.find(params[:id])
  end

  def update
    @target = Target.find(params[:id])
    @target.update(target_params)
    redirect_to action: :index
  end

  private
  def target_params
    params.require(:target).permit(:name, :text)
  end
end
