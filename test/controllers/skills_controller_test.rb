require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test 'index should return success' do
    get skills_path

    assert_response :success
  end

  test 'index as json should return success' do
    get skills_path, as: :json

    assert_response :success
  end

  test 'index as json should return a list of skills' do
    get skills_path, as: :json

    skills = @response.parsed_body

    assert_equal 3, skills.size

    assert_equal 1, skills[0]['id']
    assert_equal 'Go', skills[0]['name']
  end

  test 'show should return success' do
    get skill_path(skills(:go))

    assert_response :success
  end

  test 'show as json should return a skill' do
    get skill_path(skills(:go)), as: :json

    skill = @response.parsed_body

    assert_equal 1, skill['id']
    assert_equal 'Go', skill['name']
  end

  test 'show should return not found when skill does not exist' do
    csharp = Skill.new id: 4, name: 'C#'

    get skill_path(csharp)

    assert_response :not_found
  end

  test 'new should return success' do
    get new_skill_path

    assert_response :success
  end

  test 'edit should return success' do
    get edit_skill_path(skills(:go))

    assert_response :success
  end

  test 'edit should return not found when skill does not exist' do
    csharp = Skill.new id: 4, name: 'C#'

    get edit_skill_path(csharp)

    assert_response :not_found
  end
end
