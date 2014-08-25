class Users::SessionsController < Devise::SessionsController
  def new
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    respond_with(resource, serialize_options(resource), :layout => false)
  end
 
  def create
    super
  end
 
  def destroy
    super
  end
end