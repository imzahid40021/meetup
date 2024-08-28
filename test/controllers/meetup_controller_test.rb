require "test_helper"

class MeetupControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get meetup_home_url
    assert_response :success
  end
end
