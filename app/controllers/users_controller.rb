class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @user_images=@user.user_images.page(params[:page]).reverse_order
  end
  


  private
    def book_params
      params.require(:book).permit(:name, :body, :image)
    end


end
