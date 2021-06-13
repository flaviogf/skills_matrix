require "test_helper"

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    sign_in users(:regular)

    get dashboards_path

    assert_response :success
  end
end
