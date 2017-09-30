class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def edit
    @user = current_user
    authorize @user

    if request.patch?
      if @user.update(user_params)
        redirect_to settings_path, notice: "Settings done update."
      else
        render :edit
      end
      return
    end
  end

    def user_params
      params.require(:user).permit(:email, :one_liner, :objective, :summary)
    end


end