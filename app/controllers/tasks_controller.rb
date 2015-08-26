class TasksController < ApplicationController
  def index
    @target = Target.find(params[:target_id])
    @tasks = Task.where(target_id: params[:target_id])
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
  end

  def create
    @target  = Target.find(params[:target_id])
    @task = Task.create(task_params)
    @task.target_id = @target.id
    @task.save
  end

  private
  def task_params
    params.require(:task).permit(:name, :text)
  end
end
