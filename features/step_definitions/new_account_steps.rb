require_relative '../../features/support/dsl/dsl'

Given("the {string} provided to create a new user account") do |email|
  @email = email
  @commonHelper = CommonHelpers.new()
  @test_data = TestDataObjects.get_personal_info(@email)
  $test_id = @test_data.test_id

  puts ("\r\nEnter email provided as #{@email} with firstname #{@test_data.first_name}.")

  @commonHelper.click_sign_in
  @commonHelper.enter_text({id: 'email_create'}, @email)
  @commonHelper.click_element_by({id: 'SubmitCreate'})

  @commonHelper.enter_personal_info(@test_data)
  sleep(5)
end

When("the information needed is entered from CSV to create the account") do
  @test_data = TestDataObjects.get_personal_address(@email)
  puts ("Enter data from CSV==> Home Phone:" + @test_data.home_phone + "\r\nMobile Phone: #{@test_data.mobile_phone}")
  @commonHelper.enter_personal_address(@test_data)
  sleep(5)
end

Then("new account should be created") do
  puts ("Account should be created.\r\n")
end