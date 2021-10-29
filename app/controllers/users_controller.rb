class UsersController < ApplicationController

  def show
    @user=User.where(id: params[:id])
  end



  private
    def user_params
      params.require(:user).permit(:name, :introduction, :profile_image)
    end


end
