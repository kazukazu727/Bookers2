class BooksController < ApplicationController

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
       flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      redirect_to "/books"
    end
  end

  def index
    @user=current_user
    @books=Book.all
    @book=Book.new
    @new_book=Book.new
  end

  def show
    @new_book=Book.new
    @book=Book.find(params[:id])
    @user=User.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
    @user=User.find(params[:id])
    if @user.id != @current_user
    end
  end

  def update
     @book=Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice]="You have updated book successfully."
        redirect_to book_path(@book.id)
      else
        render :edit
      end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    flash[:notice] = "Book was successfully destroyd."
    redirect_to "/books"
  end

  def book_params
      params.require(:book).permit(:title, :body, :user_id)
  end


end
