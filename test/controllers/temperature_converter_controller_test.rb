require "test_helper"

class TemperatureConverterControllerTest < ActionDispatch::IntegrationTest
  test "should get convert" do
    get temperature_converter_convert_url
    assert_response :success
  end
end
