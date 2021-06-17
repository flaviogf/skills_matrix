require "test_helper"

class MatricesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in users(:frank)

    get matrices_path

    assert_response :success
  end

  test 'should not get index if user is not authenticated' do
    get matrices_path

    assert_redirected_to new_sessions_path
  end
end
