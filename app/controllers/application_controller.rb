class ApplicationController < ActionController::Base
  before_action :configure_premitted_parameters, if: :devise_controller?

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  def configure_premitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :first_name,
      :first_name_kana,
      :last_name,
      :last_name_kana,
      :post_code,
      :address,
      :phone_number
    ])
  end

end
