class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource({})
    @validatable = devise_mapping.validatable?
    if @validatable
      @minimum_password_length = resource_class.password_length.min
    end
    respond_with self.resource, :layout => false
  end
end