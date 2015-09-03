class TasksController < ApplicationController
  def index
    @target = Target.find(params[:target_id])
    @tasks = Task.where(target_id: params[:target_id]).where(user_id: current_user.id)
    # tasks_achieves = []
    # @tasks_achieved = false

    # if @tasks.length != 0
    #   @tasks.each do |task|
    #     if task.achieve == true
    #       tasks_achieves << 1
    #     end
    #   end
    #   if tasks_achieves.length == @tasks.length
    #     @tasks_achieved = true
    #     @target.achieve = true
    #   else
    #     @target.achieve = false
    #   end
    # else
    #   @target.achieve = true
    # end
    # @target.save
  end

  def new
    @task = Task.new
  end

  def destroy
    @task = Task.where(target_id: params[:target_id]).where(id: params[:id]).first
    @task.destroy
    redirect_to action: :index
  end

  def edit
    @task = Task.where(target_id: params[:target_id]).where(id: params[:id]).first
  end

  def update
    @task = Task.where(target_id: params[:target_id]).where(id: params[:id]).first
    @task.update(task_params)
    redirect_to action: :index
  end

  def create
    @target  = Target.find(params[:target_id])
    @task = Task.create(name: task_params[:name],text: task_params[:text],user_id: current_user.id)
    @task.target_id = @target.id
    @target.achieve = false;
    @target.save
    @task.save
  end

  private
  def task_params
    params.require(:task).permit(:name, :text)
  end
end
