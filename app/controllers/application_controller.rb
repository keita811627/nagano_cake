class ApplicationController < ActionController::Base

  ##モデルの遷移先を分ける為のコード
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_path
    when Customers
      root_path
    end

  end
end
