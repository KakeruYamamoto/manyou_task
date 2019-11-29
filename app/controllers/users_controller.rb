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
    respond_to do |format|
      if @user.save
        if @user && @user.authenticate(user_params[:password])
          session[:user_id] = @user.id
          format.html { redirect_to user_path(@user.id), notice: '新しくアカウントを作りました' }
          format.json { render :show, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
    if current_user.admin == false
      if  @user.id == current_user.id
        redirect_to new_session_path, notice:  "アカウントが違います。アクセスするには再ログインしてください"
      end
    end
  end

  def show
    if current_user.admin == false
      if @user.id != current_user.id
        redirect_to new_session_path, notice:  "アカウントが違います。アクセスするには再ログインしてください"
      end
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

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'ユーザを削除しました' }
      format.json { head :no_content }
    end
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
