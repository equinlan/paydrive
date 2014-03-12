require 'spreadsheet'

class Transaction
  def initialize(data)
    @data = data
  end
  
  def push
    # Initialize Google Spreadsheet
    spreadsheet = Spreadsheet.new({
      username: 'myUsername',
      password: 'myPassword',
      key: 'myKey' })
    row = spreadsheet.first_empty_row
    
    # Add headers if they don't exist
    if row == 1
      headers = ["Date", "Transaction ID", "Transaction Type", "Email",
        "First Name", "Last Name", "Address", "Amount", "Currency", "Status"]
      for col in 1..headers.size
        spreadsheet.ws[row, col] = headers[col - 1]
      end
      
      row += 1
    end
    
    # Prepare the data to appear in columns
    data = [Time.now, @data[:txn_id], @data[:txn_type], @data[:payer_email],
      @data[:first_name], @data[:last_name], @data[:address_zip],
      @data[:mc_gross], @data[:mc_currency], @data[:payment_status]]
    
    # Print the data for the current row
    for col in 1..data.size
      spreadsheet.ws[row, col] = data[col - 1] || "N/A"
    end
    
    # Next row
    row +=1
    
    spreadsheet.ws.save
  end
end