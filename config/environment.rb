# Load the Rails application.
require File.expand_path('../application', __FILE__)
require "spreadsheet"

# Initialize the Rails application.
Paydrive::Application.initialize!

@spreadsheet = Spreadsheet.new({
  username: 'evan.quinlan@gmail.com',
  password: 'Dr@bbl3shir3',
  key: '0AsrJDgUN24rjdEIxamJVbFJ0S0RadU5COHdpQXVxNXc' })