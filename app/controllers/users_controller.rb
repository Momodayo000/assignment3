class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
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
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(current_user)
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
