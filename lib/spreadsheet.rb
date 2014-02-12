class Spreadsheet
  def initialize(parameters)
    gdrive  = parameters['Google Drive']
    session = GoogleDrive.login(gdrive['username'], gdrive['password'])
    @ws     = session.spreadsheet_by_key(gdrive['spreadsheet key']).worksheets[0]
  end
  
  def first_empty_row
    @ws.num_rows + 1
  end
end