require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  test 'it should not allow phone out of range to be created' do
    assert_equal PhoneNumber.new(phone: 123).valid?, false
  end

  test 'phone number in range should be created' do
    assert_equal PhoneNumber.new(phone: 1234567890).valid?, true
  end

  test 'duplicate number should not be allowed' do
    # 1111111111 already their in fixtures
    assert_equal PhoneNumber.new(phone: 1111111111).valid?, false
  end

  test 'random number should be in range' do
    assert_equal PhoneNumber.random_number.in?(PhoneNumber::RANGE), true
  end
end
