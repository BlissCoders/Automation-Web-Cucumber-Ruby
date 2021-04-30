require_relative 'personal_Info'
require_relative 'personal_Address'

class TestDataObjects

  def self.get_personal_info(email)
    return PersonalInfo.get_personal_info(email)
  end

  def self.get_personal_address(email)
    return PersonalAddress.get_personal_address(email)
  end

end