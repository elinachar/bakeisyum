class BasicPagesController < ApplicationController
  def index
    @recipes = Recipe.last(3)
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
