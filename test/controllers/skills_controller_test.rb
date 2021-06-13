require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test 'should not get index if user is not authenticated' do
    get skills_path

    assert_redirected_to new_sessions_url
  end

  test 'should not get index if user is not authorized' do
    sign_in users(:regular)

    get skills_path

    assert_redirected_to dashboards_path
  end

  test 'should get index' do
    sign_in users(:admin)

    get skills_path

    assert_response :success
  end

  test 'should get new' do
    sign_in users(:admin)

    get new_skill_path

    assert_response :success
  end

  test 'should create skill' do
    assert_difference('Skill.count') do
      sign_in users(:admin)

      post skills_path, params: { skill: { name: 'Ruby' } }
    end

    assert_redirected_to skill_path(Skill.last)
  end

  test 'should not create when attributes are invalid' do
    sign_in users(:admin)

    post skills_path, params: { skill: { name: '' } }

    assert_response :unprocessable_entity
  end

  test 'should get show' do
    sign_in users(:admin)

    get skill_path(skills(:ruby))

    assert_response :success
  end

  test 'should get edit' do
    sign_in users(:admin)

    get edit_skill_path(skills(:ruby))

    assert_response :success
  end

  test 'should update skill' do
    sign_in users(:admin)

    skill = skills(:ruby)

    put skill_path(skill), params: { skill: { name: 'JavaScript' } }

    assert_redirected_to skill_path(skill)

    skill.reload

    assert_equal 'JavaScript', skill.name
  end

  test 'should not update skill if attributes are invalid' do
    sign_in users(:admin)

    skill = skills(:ruby)

    put skill_path(skill), params: { skill: { name: '' } }

    assert_response :unprocessable_entity
  end
end
