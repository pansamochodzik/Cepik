module  UserHelper
  generated_password = Devise.friendly_token.first(8)
end
