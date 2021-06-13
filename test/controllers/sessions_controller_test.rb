require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_sessions_path

    assert_response :success
  end

  test 'should create session' do
    post sessions_path, params: { session: { email: 'regular@email.com', password: 'test' } }

    user = users(:regular)

    assert_equal user.id, session[:user_id]

    assert_redirected_to dashboards_path
  end

  test 'should not create session when attributes are invalid' do
    post sessions_path, params: { session: { email: '', password: 'test' } }

    assert_response :unprocessable_entity
  end

  test 'should not create session when user does not exist' do
    post sessions_path, params: { session: { email: 'test@email.com', password: 'test' } }

    assert_response :unprocessable_entity
  end

  test 'should destroy session' do
    sign_in users(:admin)

    delete sessions_path

    assert_not session[:user_id].present?

    assert_redirected_to new_sessions_path
  end
end
