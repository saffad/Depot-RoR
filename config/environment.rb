# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Depot::Application.initialize!

# Alternate configuration example, using gmail:
# Depot::Application.configure do
#    config.action_mailer.delivery_method = :smtp
#    
#    config.action_mailer.smtp_settings = {
#      address:        "smtp.gmail.com",
#      port:           587, 
#      domain:         "gmail.com",
#      authentication: "plain",
#      user_name:      "saffad@gmail.com",
#      password:       "G06facupwin=lfc",
#      enable_starttls_auto: true
#    }
#  end
#the action mailer using smtp and these are the settings for gmail. i put it in environment.rb 
# because it will use this settings for all environments. 