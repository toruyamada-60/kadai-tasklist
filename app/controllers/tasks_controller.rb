class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  def index
    @tasks = Task.all
  end
  
  def create
    @task = Task.new(task_params)
    
      if @task.save
        flash[:success] = 'タスクが作成されました'
        redirect_to @task
      else
        flash.now[:danger] = 'タスクが作成されませんでした'
        render :new
      end
  end
  
  def new
    @task = Task.new(content: 'sample')
  end
  
  def edit
  end
  
  def show
  end
  
  def update
      if @task.update(task_params)
        flash[:success] = 'タスクが更新されました'
        redirect_to @task
      else
        flash.now[:danger] = 'タスクが更新されませんでした'
        render :edit
      end
  end
  

  def destroy
    @task.destroy
    
    flash[:success] = 'タスクが削除されました'
    redirect_to tasks_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  # strong parameter
  def task_params
    params.require(:task).permit(:content)
  end
  
end
