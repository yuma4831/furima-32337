class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :lastname, :firstname, :lastname_kana, :firstname_kana, :birthday,
                                             :password])
  end
end
