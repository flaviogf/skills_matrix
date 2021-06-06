require "test_helper"

class UserProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'index should return ok' do
    get user_profiles_path

    assert_response :ok
  end
end
