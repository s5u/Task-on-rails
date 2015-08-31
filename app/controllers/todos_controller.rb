class TodosController < ApplicationController
  def index
    @task = Task.find(params[:task_id])
    @todos = Todo.where(task_id: params[:task_id])
  end

  def new
    @todo = Todo.new
  end

  def destroy
    @todo = Todo.where(task_id: params[:task_id]).where(id: params[:id]).first
    @todo.destroy
    redirect_to action: :index
  end

  def edit
    @todo = Todo.where(task_id: params[:task_id]).where(id: params[:id]).first
  end

  def update
    @todo = Todo.where(task_id: params[:task_id]).where(id: params[:id]).first
    @todo.update(todo_params)
    redirect_to action: :index
  end

  def create
    @target  = Target.find(params[:target_id])
    @task  = Task.find(params[:task_id])
    @todo = Todo.create(todo_params)
    @todo.task_id = @task.id
    @todo.target_id = @target.id
    @todo.save
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :text)
  end

  # def todo_checkbox_params
  #   params.require(:todo).permit(:archieve)
  # end
end
