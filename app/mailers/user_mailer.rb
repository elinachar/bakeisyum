class UserMailer < ApplicationMailer
  default from: "info@bakeisyum.com"

  def contact_form(email, name, phone, message)
    @email = email
    @name = name
    @phone = phone
    @message = message
    mail(from: email,
    to: "elinachar@gmail.com",
    subject: "A new contact from #{name}")
  end

  def welcome(user)
  @appname = "Bake is Yum"
  mail( from: "welcome@bakeisyum.com"
        to: user.email,
        subject: "Welcome to #{@appname}!")
end

end
