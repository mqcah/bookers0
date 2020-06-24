class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:new]

  def new
    # redirect_to book_path
  end
  
  def index
    @book = Book.new
    @books = Book.all
    @user = User.find(current_user.id)
    @book_error = Book.new
    @users = User.all
  end
  
  def create
    @book_error = Book.new(book_params)
    @books = Book.all
    @book_error.user_id = current_user.id
    if @book_error.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_error.id)
    else
      @book = Book.new
      @books = Book.all
      @user = User.find(current_user.id)
      render :index
    end
  end

  def show
    @users = User.all
    
    # ↑ 指定し忘れやすい
    @book = Book.new
    @detail_book = Book.find(params[:id])
    #@user = User.find(params[:id])
    @user = @detail_book.user

  end

  # def edit
  #   @book = Book.find(params[:id])
  # end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def destroy
    @detail_book = Book.find(params[:id])
    @detail_book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    @user = User.find(current_user.id)
    if @book.update(book_params)
      flash[:notice] = "You Have updated book successfully."
      redirect_to book_path(@book.id)
    else 
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end