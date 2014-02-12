class ListenerController < ApplicationController
  require 'transaction'
  protect_from_forgery except: :update
  
  def notify
    Transaction.new params
    render nothing: true
  end
end
