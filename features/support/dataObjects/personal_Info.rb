require 'csv'

class PersonalInfo
  attr_accessor :test_id, :title, :first_name, :last_name, :email, :password, :date_of_birth

  def initialize(test_id, email,password,title, first_name,last_name,date_of_birth)
    self.test_id = test_id
    self.title = title
    self.first_name = first_name
    self.last_name = last_name
    self.email = email
    self.password = password
    self.date_of_birth = date_of_birth
  end


  def self.get_personal_info(email)
    puts("\r\nTest Data Path: #{$global_test_path}\r\n")
    puts("Values are being fetched from CSV with email #{email}...\r\n")
    CSV.foreach($global_test_path) do |row|
      break if row[0].nil?

      if(!row[0].nil? && row[0] != "TestId")
        # puts('Current Row Email == ' + row[1] + ' Looking for email:' + email)
        if(row[1]== email)
          # puts('Found email...')
          @_test_id = row[0]
          @_email = row[1]
          @_password = row[2]
          @_title = row[3]
          @_first_name = row[4]
          @_last_name = row[5]
          @_dob = row[6]
        end
      end

    end

    unless(@_email.to_s.length > 0 and @_email.to_s == email.to_s)
      fail("Error: Email: '#{email}' provided not found in CSV file.")
    end

    return new(@_test_id,@_email,@_password,@_title,@_first_name, @_last_name,@_dob)
  end

end