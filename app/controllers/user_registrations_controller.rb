class UserRegistrationsController < Devise::RegistrationsController
  def create
    super
    if @user.persisted?
      UserMailer.welcome(@user).deliver_now
      UserMailer.new_user(@user).deliver_now

      if @user.subscribed?
        Subscription.create(email: @user.email, language: @user.language)
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :subscribed, :language, :agreement_terms)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :subscribed, :language)
  end
end
