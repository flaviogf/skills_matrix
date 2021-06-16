require "test_helper"

class MatricesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get matrices_path

    assert_response :success
  end
end
