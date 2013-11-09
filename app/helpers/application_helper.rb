module ApplicationHelper
  def oauth_callback_url
    to('authentication/oauth_callback')
  end

  def authenticated?
    session[:oauth_token].is_a?(Hash)
  end

  def unauthenticate!
    session.clear
  end

  def current_user= current_user
    @current_user = current_user
    session[:current_user_attributes] = current_user.attributes
  end

  def current_user
    return nil unless authenticated?
    return @current_user if @current_user
    @current_user = Devbootcamp::User.new(session[:current_user_attributes])
  end

  def devbootcamp_oauth_authorize_url
    Devbootcamp::OAuth.authorize_url :redirect_uri => '/'
  end

  def devbootcamp_oauth_unauthorize_url
    Devbootcamp::OAuth.unauthorize_url :redirect_uri => to('/')
  end

  def ensure_authenticated!
    return if authenticated?
    session[:post_authorization_destination_url] = request.url if request.get?
    puts "redirecting to oatuh server"
    halt redirect devbootcamp_oauth_authorize_url
  end
end
