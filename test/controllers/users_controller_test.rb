require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get new_user_path

    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post users_path, params: {
        user: {
          name: 'Frank',
          email: 'frank@email.com',
          password: 'test',
          password_confirmation: 'test'
        }
      }
    end

    assert_redirected_to new_sessions_path
  end

  test 'should not create user when attributes are invalid' do
    post users_path, params: {
      user: {
        name: '',
        email: 'frank@email.com',
        password: 'test',
        password_confirmation: 'test'
      }
    }

    assert_response :unprocessable_entity
  end

  test 'should get show' do
    user = users(:regular)

    sign_in user

    get user_path(user)

    assert_response :success
  end

  test 'should not get show if user is not authenticated' do
    get user_path(users(:regular))

    assert_redirected_to new_sessions_path
  end
end
