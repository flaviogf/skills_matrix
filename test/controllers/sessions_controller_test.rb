require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'new should return ok' do
    get new_session_path

    assert_response :ok
  end
end
