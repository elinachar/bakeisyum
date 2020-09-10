# Load the Rails application.
require_relative 'application'
require 'carrierwave/orm/activerecord'

# Initialize the Rails application.
Rails.application.initialize!

# Connect to RoundCube email provider
ActionMailer::Base.smtp_settings = {
  address: 'localhost',
	enable_starttls_auto: true,
 	port: 587,
	authentication: :plain,
  user_name: ENV['ROUNDCUBE_USERNAME'],
  password: ENV['ROUNDCUBE_PASSWORD'],
	openssl_verify_mode: 'none'
}
