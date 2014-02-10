class AccountController < ApplicationController
  protect_from_forgery except: :update
  
  def update
    params[:cmd] = _notify-validate
    render params
  end
end
