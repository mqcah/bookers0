class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # ↑ devise利用の機能（ユーザ登録、ログイン認証など）が使われる場合、その前にconfigure_permitted_parametersが実行されます。
  def after_sign_in_path_for(resource)
    user_path(resource) # ログイン後に遷移するpathを設定
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    # ↑ ユーザ登録（sign_up）の際に、ユーザ名（name）のデータ操作が許可されます。
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    # ↑ ログイン（sign_in）の際に、ユーザ名（name）のデータ操作が許可されます。
  end
end

