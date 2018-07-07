# Preview at http://;pca;jpst:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("john@example.com", "John", "123456789", "Hello Word")
  end
end
