class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:destroy]
  
  def index
    if logged_in?
      @task = current_user.tasks.build
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
    end
  end
  
  def create
    @task = current_user.tasks.build(task_params)
    
      if @task.save
        flash[:success] = 'タスクが作成されました'
        redirect_to root_url
      else
        flash.now[:danger] = 'タスクが作成されませんでした'
        render :new
      end
  end
  
  def new
    @task = current_user.tasks.build
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
    redirect_to root_url
  end
  
  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  # strong parameter
  def task_params
    params.require(:task).permit(:content, :status)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
