class BasicPagesController < ApplicationController
  def index
    if !current_user.nil? && current_user.admin?
      @recipes = Recipe.last(3)
    else
      @recipes = Recipe.where(public: true).last(3)
    end
    @subscription = Subscription.new
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @phone, @message).deliver_now
  end

end
