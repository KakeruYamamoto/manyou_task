class Admin::UsersController < ApplicationController
  # before_action :admin_user

  def index
    @users = User.all.order(created_at: :desc).page(params[:page]).per(10)

    if params[:sort_updated]
      @users = User.order(updated_at: :desc).page(params[:page]).per(10)
    end

    if params[:sort_created]
      @users = User.order(created_at: :desc).page(params[:page]).per(10)
    end

    if params.dig(:user, :search)
      @users = User.where("user_name LIKE ?", "%#{ params[:user][:user_name] }%").where("email LIKE ?", "%#{ params[:user][:email] }%").page(params[:page]).per(10)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        if @user && @user.authenticate(user_params[:password])
          session[:user_id] = @user.id
          format.html { redirect_to user_path(@user.id), notice: '新しくアカウントを作りました' }
          format.json { render :show, status: :created, location: @user }
        end
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    if @user.id != current_user.id
      redirect_to new_session_path, notice:  "アカウントが違います。アクセスするには再ログインしてください"
    end
  end

  def show
    if @user.id != current_user.id
      redirect_to new_session_path, notice:  "アカウントが違います。アクセスするには再ログインしてください"
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: '更新しました' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password,
                                 :password_confirmation)
  end
end
