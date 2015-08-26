class TodosController < ApplicationController
  def index
    @task = Task.find(params[:task_id])
    @todos = Todo.where(task_id: params[:task_id])
  end

  def new
    @todo = Todo.new
  end

  def create
    @task  = Task.find(params[:task_id])
    @todo = Todo.create(todo_params)
    @todo.task_id = @task.id
    @todo.save
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :text)
  end
end
