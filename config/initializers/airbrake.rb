Airbrake.configure do |config|
  if Rails.env.production?
    config.api_key    = "PLEASE ENTER YOUR PRODUCTION API KEY"
  else
    config.api_key    = "PLEASE ENTER YOUR STAGING API KEY"
  end
  config.host       = 'PLEASE ENTER A VALID HOST'
  config.port       = 80
  config.secure     = config.port == 8080
end
