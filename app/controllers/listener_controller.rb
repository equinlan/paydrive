class ListenerController < ApplicationController
  require 'net/https'
  require 'transaction'
  require 'uri'
  
  skip_before_action :verify_authenticity_token
  
  def notify
    # Validate response
    response = validate_IPN_notification(request.raw_post)
    puts response # Debug
    
    # Save to Google Drive file
    if response == "VERIFIED"
      transaction = Transaction.new params
      transaction.push
    end
    
    render :nothing => true
  end
  
  private
  
  def validate_IPN_notification(raw)
    uri = URI.parse('https://www.paypal.com/cgi-bin/webscr?cmd=_notify-validate')
    http = Net::HTTP.new(uri.host, uri.port)
    # http.open_timeout = 60
    # http.read_timeout = 60
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true
    
    http.post(uri.request_uri, raw).body # Should equal "INVALID" or "VERIFIED"
  end
end
