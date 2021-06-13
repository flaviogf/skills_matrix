require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:frank)
  end

  test 'should get index' do
    get skills_path

    assert_response :success
  end

  test 'should not get index if user is not authenticated' do
    sign_out

    get skills_path

    assert_redirected_to new_sessions_path
  end

  test 'should get new' do
    get new_skill_path

    assert_response :success
  end

  test 'should create skill' do
    assert_difference('Skill.count') do
      post skills_path, params: { skill: { name: 'Ruby' } }
    end

    assert_redirected_to skill_path(Skill.last)
  end

  test 'should not create if attributes are invalid' do
    post skills_path, params: { skill: { name: '' } }

    assert_response :unprocessable_entity
  end
end
