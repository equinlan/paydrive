class AccountController < ApplicationController
  protect_from_forgery except: :update
  
  def update
    puts params
    render nothing: true
  end
end
