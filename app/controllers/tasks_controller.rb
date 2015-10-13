class TasksController < ApplicationController
  before_action :task_find, only: [:destroy, :edit, :update]

  def index
    @target = Target.find(params[:target_id])
    @tasks = @target.tasks.rank(:row_order)
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

  def sort
    task = Task.where(target_id: params[:target_id], id: params[:task_id]).first
    task.update(task_params)
    render nothing: true
  end

  def create
    @target = Target.find(params[:target_id])
    @task = @target.tasks.new(task_params)
    @task.user_id = current_user.id
    @target.achieve = false;
    @target.save
    @task.save
  end

  private
  def task_params
    params.require(:task).permit(:name, :text, :row_order_position)
  end

  def task_find
    @task = Task.where(target_id: params[:target_id], id: params[:id]).first
  end
end
