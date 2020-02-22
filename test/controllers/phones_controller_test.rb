require 'test_helper'

class PhonesControllerTest < ActionDispatch::IntegrationTest
  test "Create API: Random number allocation" do
    post "/phones"
    assert_equal 200, status
    assert_equal response.parsed_body['phone'].in?(PhoneNumber::RANGE), true
  end

  test "Create API: When phone number is 1234567890" do
    post "/phones/1234567890"
    assert_equal 200, status
    assert_equal response.parsed_body['phone'] === 1234567890, true
  end

  test "Create API: When phone number is 1111111111" do
    post "/phones/1111111111"
    assert_equal 400, status
  end

  test "List Phones" do
    get "/phones"
    assert_equal 200, status
    expected_phone_numbers = [9999999999, 3412315678, 1111111111]
    response.parsed_body.each_with_index do |phone_number, i|
      assert_equal phone_number['phone'] == expected_phone_numbers[i], true
    end
  end
end
