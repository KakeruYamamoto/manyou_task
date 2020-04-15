# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]
  before_action :render_page

  def index
    @tasks = current_user.tasks.order(created_at: :desc).page(params[:page]).per(5)

    if params[:sort_deadline]
      @tasks = current_user.tasks.order(deadline: :asc).page(params[:page]).per(5)
    end

    if params[:sort_priority]
      @tasks = current_user.tasks.order(priority: :asc).page(params[:page]).per(5)
    end

    if params.dig(:task, :search)
      @tasks = current_user.tasks.where('task_name LIKE ?', "%#{params[:task][:task_name]}%").where('status LIKE ?', "%#{params[:task][:status]}%").page(params[:page]).per(5)
    end

    if params[:label_id].present?
      @tasks = @tasks.joins(:labels).where(labels: { id: params[:label_id] })
    end
  end

  def show; end

  def new
    @task = Task.new
  end

  def edit; end

  def create
    @task = current_user.tasks.new(task_params)
    if @task.save
      redirect_to @task, notice: 'タスクを作成しました'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'タスクを更新しました'
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'タスクを削除しました'
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:task_name, :task_content, :deadline, :status, :priority, { label_ids: [] })
  end
end
