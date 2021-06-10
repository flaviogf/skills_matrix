require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'new should return ok' do
    get new_session_path

    assert_response :ok
  end

  test 'create should redirect to user profiles' do
    request_params = { session: { email: 'frank@email.com', password: 'test123' } }

    post sessions_path, params: request_params

    assert_redirected_to user_profiles_path
  end

  test 'create should set current user' do
    request_params = { session: { email: 'frank@email.com', password: 'test123' } }

    post sessions_path, params: request_params

    user = users(:frank)

    current_user = @controller.send(:current_user)

    assert_equal user, current_user
  end

  test 'create should return unauthorized when email or password are invalid' do
    request_params = { session: { email: 'frank@email.com', password: 'test1234' } }

    post sessions_path, params: request_params

    assert_response :unauthorized
  end

  test 'create should return error when email or password are invalid' do
    request_params = { session: { email: 'frank@email.com', password: 'test1234' } }

    post sessions_path, params: request_params

    assert_equal 'Invalid email or password', flash[:error]
  end
end
