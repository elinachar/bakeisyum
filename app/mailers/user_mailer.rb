class UserMailer < ApplicationMailer
  default from: "info@bakeisyum.com"

  def contact_form(email, name, phone, message)
    @email = email
    @name = name
    @phone = phone
    @message = message
    mail( from: email,
          to: "elinachar@gmail.com",
          subject: "A new contact from #{name}")
  end

  def new_recipe(recipe)
    @recipe = recipe
    @appname = "Bake is Yum"
    @subscriptions = Subscription.all
    @subscriptions.each do |subscription|
      @subscription = subscription
      mail( to: subscription.email,
            subject: @recipe.name + " from " + @appname)
    end
  end


  def subscription_successful(subscription, recipes)
    @subscription = subscription
    @recipes = recipes
    @appname = "Bake is Yum"
    mail( from: "welcome@bakeisyum.com",
          to: @subscription.email,
          subject: "Thank you for subscribed to #{@appname}!")
  end

  def welcome(user)
    @appname = "Bake is Yum"
    mail( from: "welcome@bakeisyum.com",
          to: user.email,
          subject: "Welcome to #{@appname}!")
  end

end
