# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Saas::Application.initialize!

# ActionMailer config
Saas::Application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.default :charset => "utf-8"
end
