class SessionsController < Devise::SessionsController

  def create
    resource = warden.authenticate!(:scope => resource_name, :recall => :failure)
    return sign_in_and_redirect(resource_name, resource)
    # redirect_to :controller => "home", :action => 'index'
  end

# @param resource_or_scope [Object]
# @param resource [Object]
  def sign_in_and_redirect(resource_or_scope, resource=nil)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    resource ||= resource_or_scope
    sign_in(scope, resource) unless warden.user(scope) == resource

    respond_to do |format|
      format.json {render :text => "Ok!"}
      format.html {redirect_to :controller => "home", :action => 'index'}
                                                                                                                                       #format.html  { redirect_to :controller => "home", :action => 'index' }
    end

  end


  def failure
    return render:json => {:success => false, :errors => ["Login failed."]}
  end
end