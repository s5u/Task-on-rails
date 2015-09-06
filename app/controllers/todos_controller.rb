class TodosController < ApplicationController
  before_action :todo_find, only: [:destroy, :edit, :update, :achieve]

  def index
    @task = Task.find(params[:task_id])
    @todos = Todo.where(task_id: params[:task_id], user_id: current_user.id)
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
    if @todo.achieve == false
      @todo.achieve = true
    else
      @todo.achieve = false
    end
    @todo.save
    redirect_to action: :index
  end

  def create
    @target  = Target.find(params[:target_id])
    @task  = Task.find(params[:task_id])
    @todo = Todo.create(name: todo_params[:name],text: todo_params[:text],user_id: current_user.id)
    @todo.task_id = @task.id
    @todo.target_id = @target.id
    @target.achieve = false
    @task.achieve  = false
    @target.save
    @task.save
    @todo.save
  end

  private
  def todo_params
    params.require(:todo).permit(:name, :text)
  end

  def todo_find
    @todo = Todo.where(task_id: params[:task_id], id: params[:id]).first
  end
end
