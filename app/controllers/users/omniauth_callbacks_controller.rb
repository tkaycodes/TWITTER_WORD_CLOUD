class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController


def twitter
   omniauth_data = request.env["omniauth.auth"].to_hash
  # user = User.find_or_create_from_twitter(omniauth_data)
    render json: omniauth_data
  # if user
  #   sign_in user 
  #   redirect_to root_path, notice: "Welcome!"
  # else
  #   redirect_to root_path, alert: "Sorry! contact us if problem persists."
  # end
end



end
