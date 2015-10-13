class TodosController < ApplicationController
  before_action :todo_find, only: [:destroy, :edit, :update, :achieve]

  def index
    @task = Task.find(params[:task_id])
    @todos = @task.todos.rank(:row_order)
    todo_achieves = []
    @todo_achieved = false
    @todo_achieved = Todo.todo_achieve_judge(@task,@todos,todo_achieves,@todo_achieved)
  end

  def new
    @todo = Todo.new
  end

  def destroy
    @todo.destroy
    redirect_to action: :index
  end

  def edit
  end

  def update
    @todo.update(todo_params)
    redirect_to action: :index
  end

  def achieve
    @todo.achieve = @todo.achieve == false
    @todo.save
    redirect_to action: :index
  end

  def sort
    todo =  Todo.where(task_id: params[:task_id], id: params[:todo_id]).first
    todo.update(todo_params)
    render nothing: true
  end

  def create
    @target  = Target.find(params[:target_id])
    @task  = Task.find(params[:task_id])
    @todo = @task.todos.new(todo_params)
    @todo.target_id = @target.id
    @todo.user_id = current_user.id
    @target.achieve = false
    @task.achieve  = false
    @target.save
    @task.save
    @todo.save
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :text, :row_order_position)
  end

  def todo_find
    @todo = Todo.where(task_id: params[:task_id], id: params[:id]).first
  end
end
