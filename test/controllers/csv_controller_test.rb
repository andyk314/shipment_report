require 'test_helper'

class CsvControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get csv_show_url
    assert_response :success
  end

end
