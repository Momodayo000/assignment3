class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新に成功しました"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "投稿に失敗しました"
      @books = Book.all
      @user = current_user
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
