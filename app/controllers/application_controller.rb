class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name]) #  更新時にnameというキーのパラメーターを追加で許可する
    devise_parameter_sanitizer.permit(:account_update, keys: [:icon]) #iconキーのパラメータをアカウントアップデート時に許可
  end
end
