class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


def twitter
  omniauth_data = request.env["omniauth.auth"].to_hash
  render json: omniauth_data
end



end
