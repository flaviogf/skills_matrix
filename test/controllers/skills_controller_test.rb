require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get skills_path

    assert_response :success
  end
end
