Rollbar.configure do |config|

  config.access_token = 'cd4b203fdca748ac9fddb096ffec1d49'

  if Rails.env.test?
    config.enabled = false
  end

  config.environment = ENV['ROLLBAR_ENV'].presence || Rails.env
end
