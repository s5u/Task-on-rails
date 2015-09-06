class TasksController < ApplicationController
  before_action :task_find, only: [:destroy, :edit, :update]

  def index
    @target = Target.find(params[:target_id])
    @tasks = Task.where(target_id: params[:target_id]).where(user_id: current_user.id)
    tasks_achieves = []
    @tasks_achieved = false
    @tasks_achieved = Task.task_achieve_judge(@tasks, tasks_achieves, @tasks_achieved)
  end

  def new
    @task = Task.new
  end

  def destroy
    @task.destroy
    redirect_to action: :index
  end

  def edit
  end

  def update
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
  def task_find
    @task = Task.where(target_id: params[:target_id]).where(id: params[:id]).first
  end
end
