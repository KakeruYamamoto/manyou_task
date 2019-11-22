class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  PER = 5
  # GET /tasks
  # GET /tasks.json
  def index

    @tasks = Task.order(created_at: :desc)
    @tasksp = Task.page(params[:page]).per(PER)

    if params[:sort_deadline]
      @tasks = Task.order(deadline: :asc)
    end

    if params[:sort_priority]
      @tasks = Task.order(priority: :asc)
    end

    if params.dig(:task, :search)
      @tasks = Task.where("task_name LIKE ?", "%#{ params[:task][:task_name] }%").where("status LIKE ?", "%#{ params[:task][:status] }%")
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
    # render :new if @task.invalid?
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'タスクを作成しました' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'タスクを更新しました' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'タスクを削除しました' }
      format.json { head :no_content }
    end
  end

  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @posts = Task.search(params[:search])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:task_name, :task_content, :deadline, :status, :priority, :task_label)
    end
end
