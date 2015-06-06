# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
CityBird::Application.config.secret_token = 'a448359321fbb463f18402cc50f93417dee09893ff37ea309a8246ee2812763a68c05622e6e304eb7d36f8636550ebf7cd1f35fa7546e968e4d674f4dfd19568'

secrets_yml = YAML.load_file("#{Rails.root}/config/secrets.yml")

DOMAIN          = secrets_yml[Rails.env][:domain]
FACEBOOK_APP_ID = secrets_yml[Rails.env]['facebook_app_id']
FACEBOOK_SECRET = secrets_yml[Rails.env]['facebook_secret']
MAILGUN_API_KEY = secrets_yml[Rails.env]['mailgun_api_key']
