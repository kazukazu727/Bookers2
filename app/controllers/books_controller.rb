class BooksController < ApplicationController

  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
       flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :show
    end
  end

  def show
    @book=Book.find(params[:id])
  end

  def book_params
      params.require(:book).permit(:title, :opinion, :user_id)
  end


end
