class TasksController < ApplicationController
  def index
    @target = Target.find(params[:target_id])
    @tasks = Task.where(target_id: params[:target_id])
  end

  def new
    @task = Task.new
  end

  def destroy
    @task = Task.where(target_id: params[:target_id] && id: params[:id])
    binding.pry
    @task.destroy
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
