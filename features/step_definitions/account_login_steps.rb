require_relative '../../features/support/dsl/dsl'

Given("the {string} and {string}") do |email, password|
  @commonHelper = CommonHelpers.new()
  @test_data = TestDataObjects.get_personal_info(email)
  $test_id = @test_data.test_id

  @commonHelper.click_sign_in
  @commonHelper.login_user(email,password)
end

Then("the user should be able to login") do
  @commonHelper.wait_for_object_id({class: 'account'})

  puts("\r\nUser should be able to login and in the main page.")
  elem = $driver.find_element(:class,'account')
  puts("Account Name: #{elem.text}")

end