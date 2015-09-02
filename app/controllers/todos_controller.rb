class TodosController < ApplicationController
  def index
    @task = Task.find(params[:task_id])
    @todos = Todo.where(task_id: params[:task_id]).where(user_id: current_user.id)
    todo_achieves = []
    @todo_achieved = false

    if @todos.length != 0
      @todos.each do |todo|
        if todo.achieve == true
          todo_achieves << 1
        end
      end
      if todo_achieves.length == @todos.length
        @todo_achieved = true
        @task.achieve = true
      else
        @task.achieve = false
      end
    else
      @task.achieve = true
    end
    @task.save
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

  def achieve
    @todo = Todo.where(task_id: params[:task_id]).where(id: params[:id]).first
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
end
