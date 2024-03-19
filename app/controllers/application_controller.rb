class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def layout_by_resource
    if devise_controller? 
      'admins_devise'
    else
      'application'
    end
  end
end
