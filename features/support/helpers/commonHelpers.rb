class CommonHelpers

  def wait_for_object_id(locator)
    wait = Selenium::WebDriver::Wait.new(:timeout => 15)

    begin
      wait.until { $driver.find_element(locator).displayed? } #check if object is displayed
      return $driver.find_element(locator).displayed?
    rescue
      ##this block get's executed if there is any kind of exception error
      fail("Error: Object Id: #{locator} not found, after waiting fro 15 seconds.")
    end

  end

  def click_element_by(locator)
    element = nil?

    if wait_for_object_id(locator)
      element = $driver.find_element(locator)
    end

    element.click
  end

  def enter_text(locator,text_value)
    if wait_for_object_id(locator)
      element = $driver.find_element(locator)
      element.clear
      element.send_keys text_value
    end
  end

  def click_sign_in
    click_element_by({class: 'login'})
  end

  def login_user(email,password)
    enter_text({id: 'email'},email)
    enter_text({id: 'passwd'},password)
    click_element_by({id: 'SubmitLogin'})
  end


  def enter_personal_info(personal_info)
    puts ("\r\nTitle: #{personal_info.title}")
    if personal_info.title.to_s.downcase == 'mr.'
      click_element_by({id: 'id_gender1'})
    elsif personal_info.title.to_s.downcase == 'mrs.'
      click_element_by({id: 'id_gender2'})
    end

    enter_text({id: 'customer_firstname'},personal_info.first_name)
    enter_text({id: 'customer_lastname'},personal_info.last_name)
    enter_text({id: 'passwd'},personal_info.password)

    #enter date of birth
    @dob = personal_info.date_of_birth.split('-')
    select_from_options({id: 'uniform-days'},@dob[0])
    select_from_options({id: 'uniform-months'},@dob[1])
    select_from_options({id: 'uniform-years'},@dob[2])

  end

  def enter_personal_address(personal_address)
    enter_text({id: 'company'},personal_address.company)
    enter_text({id: 'city'},personal_address.city)
    enter_text({id: 'address1'},personal_address.address_line_one)
    enter_text({id: 'address2'},personal_address.address_line_two)
    select_from_options({id: 'uniform-id_state'},personal_address.state)
    enter_text({id: 'postcode'},personal_address.zip_code)
    enter_text({id: 'phone'},personal_address.home_phone)
    enter_text({id: 'phone_mobile'},personal_address.mobile_phone)
    enter_text({id: 'other'},personal_address.additional_info)
    enter_text({id: 'alias'},personal_address.add_alias)

    sleep(5)

    #Register
    # click_element_by({id: 'submitAccount'})
  end


  def select_from_options(locator, text_value)
    click_element_by(locator)
    select_list = $driver.find_element(locator)
    options = select_list.find_elements(:tag_name => "option")
    options.each do |opt|
      # puts("\r\nOption value:'#{opt.text}' == text_value:'#{text_value}'")
      if opt.text.to_s.downcase.strip == text_value.to_s.downcase.strip
        opt.click
        break
      end
    end
  end


  def create_href_list
    File.new($href_file_path, "w")
    # File.write('C:\AutomationTest\Jordan_Jubilo\HrefLinks.txt', "ImageURL\n")
  end

  def write_file_href(text_href)
    File.write($href_file_path, text_href + "\n", mode: "a")
  end

  def read_href_link_text(file_path,text_to_find)
    text_found =''
    puts("\r\nReading href links\r\n...")
    File.foreach(file_path).with_index do |line, line_num|
      puts "#{line_num}: #{line}"

      line_items = line.to_s.split('||')

      if line_items[0].to_s.downcase.strip == text_to_find.to_s.downcase.strip
        puts "\r\n\r\n==============>Found you: #{line}"
        text_found = line_items[1]
        break
      end
    end

    return text_found
  end

  def navigateTo(link)
    puts("++++++++LINK:#{link}")
    $driver.get link
    sleep(5)
  end


end