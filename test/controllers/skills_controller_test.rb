require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test 'get should return success' do
    get skills_path

    assert_response :success
  end

  test 'get as json should return success' do
    get skills_path, as: :json

    assert_response :success
  end

  test 'get as json should return a list of skills' do
    get skills_path, as: :json

    skills = @response.parsed_body

    assert_equal 3, skills.size

    assert_equal skills[0]['id'], 1
    assert_equal skills[0]['name'], 'Go'
  end
end
