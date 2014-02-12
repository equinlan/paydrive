require 'google_drive'

class Spreadsheet
  def initialize(parameters)
    session = GoogleDrive.login(parameters[:username], parameters[:password])
    @ws     = session.spreadsheet_by_key(parameters[:key]).worksheets[0]
  end
  
  def first_empty_row
    @ws.num_rows + 1
  end
end