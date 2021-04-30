

class PersonalAddress
  attr_accessor :first_name, :last_name, :company, :address_line_one, :address_line_two, :city, :state, :zip_code, :country, :additional_info, :home_phone, :mobile_phone, :add_alias

  def initialize(first_name, last_name, company, address_line_one, address_line_two, city, state, zip_code, country, additional_info, home_phone, mobile_phone, add_alias)
    self.first_name = first_name
    self.last_name = last_name
    self.company = company
    self.address_line_one = address_line_one
    self.address_line_two = address_line_two
    self.city = city
    self.state = state
    self.zip_code = zip_code
    self.country = country
    self.additional_info = additional_info
    self.home_phone = home_phone
    self.mobile_phone = mobile_phone
    self.add_alias = add_alias
  end


  def self.get_personal_address(email)
    puts("\r\nTest Data Path: #{$global_test_path}\r\n")
    puts("Values are being fetched from CSV with email #{email}...\r\n")
    CSV.foreach($global_test_path) do |row|
      break if row[0].nil?

      if(!row[0].nil? && row[0] != "TestId")
        # puts('Current Row Email == ' + row[1] + ' Looking for email:' + email)
        if(row[1]== email)
          # puts('Found email...')
          @_first_name = row[4]
          @_last_name = row[5]
          @_company = row[7]
          @_address_line_one = row[8]
          @_address_line_two = row[9]
          @_city = row[10]
          @_state = row[11]
          @_zip_code = row[12]
          @_country = row[13]
          @_additional_info = row[14]
          @_home_phone = row[15]
          @_mobile_phone = row[16]
          @_add_alias = row[17]
        end
      end

    end

    unless(@_first_name.length > 0)
      fail("Error: Email: '#{email}' provided not found in CSV file.")
    end

    return new(
               @_first_name,
               @_last_name,
               @_company,
               @_address_line_one,
               @_address_line_two,
               @_city,
               @_state,
               @_zip_code,
               @_country,
               @_additional_info,
               @_home_phone,
               @_mobile_phone,
               @_add_alias
              )
  end

end