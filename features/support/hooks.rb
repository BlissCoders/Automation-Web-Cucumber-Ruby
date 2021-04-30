Before do
  # create a driver object.
  Selenium::WebDriver::Chrome::Service.driver_path=File.join(Dir.pwd, 'features/support/chromedriver.exe')
  $driver = Selenium::WebDriver.for :chrome

  # open automationpractice.com inside Chrome
  $driver.get "http://automationpractice.com"
end

After do |scenario|
  # if scenario.failed?
    if !File.directory?("screnshots")
      FileUtils.mkdir_p("screnshots")
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_name = "Test" + $test_id +"_" +time_stamp + ".png"
    screenshot_file = File.join("screnshots", screenshot_name)
    puts("\r\nScreenshot Filename: #{screenshot_file}")
    # $driver.save_screenshot(screenshot_file)
    #embed("#{screenshot_file}", "image/png")
    $driver.save_screenshot(screenshot_file)
  # end

  # close browser and driver
  $driver.close
  $driver.quit
end

AfterConfiguration do
  FileUtils.rm_r("screenshots") if File.directory?("screenshots")
end