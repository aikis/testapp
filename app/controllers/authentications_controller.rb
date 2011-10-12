class AuthenticationsController < ApplicationController
  def index
    @authentications = Authentication.all
  end

  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      if current_user && (current_user.id != authentication.user_id)
        redirect_to :root, :notice => "Someone has been already added this #{omniauth['provider']} account."
      else
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, authentication.user)
      end
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to "/home/index"
    else
      user = User.new
      user.apply_omniauth(omniauth)
      if user.save
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect(:user, user)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

  def destroy
    @authentication = Authentication.find(params[:id])
    @authentication.destroy
    redirect_to :back, :notice => "Successfully destroyed authentication."
  end

  protected
  # This is necessary since Rails 3.0.4
  # See https://github.com/intridea/omniauth/issues/185
  # and http://www.arailsdemo.com/posts/44
  def handle_unverified_request
    true
  end

end
