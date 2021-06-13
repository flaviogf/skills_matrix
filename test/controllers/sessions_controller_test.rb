require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_sessions_path

    assert_response :success
  end

  test 'should create session' do
    post sessions_path, params: { session: { email: 'frank@email.com', password: 'test' } }

    assert session[:user_id].present?

    assert_redirected_to skills_path
  end

  test 'should create fail if attributes are invalid' do
    post sessions_path, params: { session: { email: '', password: 'test' } }

    assert_response :unprocessable_entity
  end

  test 'should create fail if credentials are wrong' do
    post sessions_path, params: { session: { email: 'frank@email.com', password: 'wrong' } }

    assert_response :unauthorized
  end

  test 'should destroy session' do
    sign_in users(:frank)

    delete sessions_path

    assert_not session[:user_id].present?

    assert_redirected_to new_sessions_path
  end
end
