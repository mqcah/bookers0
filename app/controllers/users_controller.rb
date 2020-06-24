class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:new]
  
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    @books = Book.all

  end

 
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    # ↑ userのid等の情報をbookに紐付ける？
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def new
    
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end    
end