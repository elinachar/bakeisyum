# Preview at http://;pca;jpst:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def contact_form
    UserMailer.contact_form("john@example.com", "John", "123456789", "Hello Word")
  end

  def new_recipe
    UserMailer.new_recipe(Recipe.first, Subscription.first)
  end

  def subscription_successful
    UserMailer.subscription_successful(Subscription.first, Recipe.last(3))
  end

  def welcome
    UserMailer.welcome(User.first)
  end



end
