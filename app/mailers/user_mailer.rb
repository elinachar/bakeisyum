class UserMailer < ApplicationMailer
  default from: 'Bake is Yum <info@bakeisyum.com>'

  def contact_form(email, name, phone, message)
    @email = email
    @name = name
    @phone = phone
    @message = message
    mail( from: email,
          to: "info@bakeisyum.com",
          subject: "A new contact from #{name}")
  end

  def new_recipe(recipe, subscription)
    @recipe = recipe
    @appname = "Bake is Yum"
    @subscription = subscription
    mail( to: @subscription.email,
          subject: @recipe.name + " from " + @appname)
  end


  def subscription_successful(subscription, recipes)
    @subscription = subscription
    @recipes = recipes
    @appname = "Bake is Yum"
    mail( to: @subscription.email,
          subject: "Thank you for subscribed to #{@appname}!")
  end

  def new_subscription(subscription)
    @subscription = subscription
    @appname = "Bake is Yum"
    mail( to: "info@bakeisyum.com",
          subject: "New Subscription at #{@appname}")
  end

  def welcome(user)
    @appname = "Bake is Yum"
    @user = user
    mail( to: @user.email,
          subject: "Welcome to #{@appname}!")
  end

  def new_user(user)
    @appname = "Bake is Yum"
    @user = user
    mail( to: "info@bakeisyum.com",
          subject: "New Sign Up at #{@appname}")
  end

end
