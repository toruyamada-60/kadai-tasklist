class TasksController < ApplicationController
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
    @task = Task.find(params[:id])
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
      if @task.update(task_params)
        flash[:success] = 'タスクが更新されました'
        redirect_to @task
      else
        flash.now[:danger] = 'タスクが更新されませんでした'
        render :edit
      end
  end
  

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'タスクが削除されました'
    redirect_to tasks_url
  end
  
  private
  
  # strong parameter
  def task_params
    params.require(:task).permit(:content)
  end
  
end
