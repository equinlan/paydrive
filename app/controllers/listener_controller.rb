class ListenerController < ApplicationController
  require 'transaction'
  protect_from_forgery except: :update
  
  def notify
    transaction = Transaction.new params
    transaction.save
    render nothing: true
  end
end
