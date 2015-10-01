class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    thanks_path(welcome: resource.id)
  end
end