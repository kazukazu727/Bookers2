class BooksController < ApplicationController

  def new
    @book.Book.new
  end

  def create
    @book=Book.new(book_params)
    @books=Book.all
    if @book.save
       flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :show
    end
  end

  def book_params
      params.require(:book).permit(:title, :opinion, :user_id)
  end


end
