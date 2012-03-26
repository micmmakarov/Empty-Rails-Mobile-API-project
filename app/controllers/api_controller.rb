class APIcontroller < ActionController::Base
  protect_from_forgery :except => :userinfo
  skip_before_filter :authenticate_user!

  def

  end


end
