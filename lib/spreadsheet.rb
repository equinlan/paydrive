class Spreadsheet
  def initialize(parameters)
    gdrive  = parameters['Google Drive']
    session = GoogleDrive.login(gdrive['username'], gdrive['password'])
    @ws     = session.spreadsheet_by_key(gdrive['spreadsheet key']).worksheets[0]
  end
  
  def dedupe(payments)
    new_payments = payments
    
    # Drop payment if it already exists in spreadsheet...
    for row in 2..@ws.num_rows
      # ...but not if it exists with a different state
      new_payments = new_payments.delete_if { |payment|
        payment.id == @ws[row, 1] && payment.state == @ws[row, 4]
        }
    end
    
    return new_payments
  end
  
  def first_empty_row
    @ws.num_rows + 1
  end
end