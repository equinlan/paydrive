class AccountController < ApplicationController
  protect_from_forgery except: :update
  
  def notify
    "Hello, world!"
    render nothing: true
  end
end
