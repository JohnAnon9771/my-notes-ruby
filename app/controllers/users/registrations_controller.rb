class Users::RegistrationsController < Devise::RegistrationsController
  URL_FOR_RANDOM_AVATAR = "https://avatars.dicebear.com/api/bottts/"

  def create
    avatar = URL_FOR_RANDOM_AVATAR + signup_params[:name].downcase + ".svg"
    @user = User.create_with(avatar: avatar).create(signup_params)

    if @user.save
      sign_in_and_redirect @user, event: :authentication
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def signup_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def account_update_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
    end
end
