class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :edit, :destroy]
  before_action :render_page, except: [:new, :create]

  def new
    if logged_in?
      redirect_to tasks_path, notice: 'アカウントを新規作成する場合、ログアウトして下さい'
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      if @user && @user.authenticate(user_params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user.id), notice: '新しくアカウントを作りました'
      end
    else
      render :new
    end
  end

  def edit
    if @user.user_name == "admin"
      redirect_to admin_users_path, notice: 'このユーザは編集できません！'
    end

    if current_user.admin == false
      if  @user.id == current_user.id
        redirect_to new_session_path, notice:  "アカウントが違います。アクセスするには再ログインしてください"
      end
    end
  end

  def show
    if current_user.admin == false
      if @user.id != current_user.id
        redirect_to tasks_path, notice:  "アカウントが違います。アクセスするには再ログインしてください"
      end
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: '更新しました'
    else
      render :edit
    end
  end

  def destroy
    if @user.user_name == "admin" && User.where(admin:true).count == 1
      redirect_to admin_users_path, notice: 'このユーザは削除できません'
    else
      @user.destroy
      redirect_to admin_users_path, notice: 'ユーザを削除しました'
    end
    @user.destroy
    redirect_to admin_users_path, notice: 'ユーザを削除しました'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password,
                                 :password_confirmation, :admin)
  end
end
