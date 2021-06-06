require "test_helper"

class UserProfilesControllerTest < ActionDispatch::IntegrationTest
  test 'index should return ok' do
    sign_in_as users(:frank), 'test123'

    get user_profiles_path

    assert_response :ok
  end

  test 'index should redirect to new_session_path when user is not logged' do
    get user_profiles_path

    assert_redirected_to new_session_path
  end
end
