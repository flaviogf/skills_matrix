require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test 'should not get index if user is not authenticated' do
    get skills_path

    assert_redirected_to new_session_url
  end

  test 'should not get index if user is not authorized' do
    sign_in users(:regular)

    get skills_path

    assert_response :forbidden
  end

  test 'should get index' do
    sign_in users(:admin)

    get skills_path

    assert_response :success
  end
end
