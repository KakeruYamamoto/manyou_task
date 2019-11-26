class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update,]

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
      redirect_to user_path, notice:  "ログインしてください"
    end
  end

  def show
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

  # def favorite
  #   @favorites = current_user.favorite_feeds.all
  # end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:user_name, :email, :password,
                                 :password_confirmation)
  end
end
#
#
# params[:session] == nil
#
# params[:session][:password] == nil[:password]
