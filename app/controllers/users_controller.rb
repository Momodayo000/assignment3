class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Updatesuccessfully"
      redirect_to user_path(current_user)
    else
      flash[:notice] = "Posterror"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
