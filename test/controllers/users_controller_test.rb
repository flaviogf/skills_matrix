require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'new should return ok' do
    get new_user_path

    assert_response :ok
  end

  test 'create should redirect to new session' do
    request_params = { user: { name: 'Bruce', email: 'bruce@wayne.com', password: 'test123', password_confirmation: 'test123' } }

    post users_path, params: request_params

    assert_redirected_to new_session_path
  end

  test 'create should create a new user' do
    request_params = { user: { name: 'Bruce', email: 'bruce@wayne.com', password: 'test123', password_confirmation: 'test123' } }

    post users_path, params: request_params

    user = User.last

    assert_equal 3, User.count
    assert_equal 'Bruce', user.name
    assert_equal 'bruce@wayne.com', user.email
  end

  test 'create should return unprocessable entity when request params is not valid' do
    request_params = { user: { name: '', email: 'bruce@wayne.com', password: 'test123', password_confirmation: 'test123' } }

    post users_path, params: request_params

    assert_response :unprocessable_entity
  end

  test 'create should return unprocessable entity when email is already taken' do
    request_params = { user: { name: 'Frank', email: 'frank@email.com', password: 'test123', password_confirmation: 'test123' } }

    post users_path, params: request_params

    assert_response :unprocessable_entity
  end

  test 'create as json should return created' do
    request_params = { user: { name: 'Bruce', email: 'bruce@wayne.com', password: 'test123', password_confirmation: 'test123' } }

    post users_path, params: request_params, as: :json

    assert_response :created
  end

  test 'create as json should return unprocessable entity when request params is not valid' do
    request_params = { user: { name: '', email: 'bruce@wayne.com', password: 'test123', password_confirmation: 'test123' } }

    post users_path, params: request_params, as: :json

    assert_response :unprocessable_entity
  end
end
