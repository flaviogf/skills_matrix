require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:frank)
  end

  test 'should get index' do
    get skills_path

    assert_response :success
  end

  test 'should get index as json' do
    get skills_path, as: :json

    body = response.parsed_body

    assert_equal 1, body.size
    assert_equal 1, body.first['developer_skills'].size
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

    assert_redirected_to skills_path
  end

  test 'should not create if attributes are invalid' do
    post skills_path, params: { skill: { name: '' } }

    assert_response :unprocessable_entity
  end

  test 'should get edit' do
    get edit_skill_path(skills(:ruby))

    assert_response :success
  end

  test 'should update skill' do
    skill = skills(:ruby)

    put skill_path(skill), params: { skill: { name: 'golang' } }

    skill.reload

    assert_equal 'golang', skill.name

    assert_redirected_to skills_path
  end

  test 'should not update skill if attributes are invalid' do
    skill = skills(:ruby)

    put skill_path(skill), params: { skill: { name: '' } }

    assert_response :unprocessable_entity
  end

  test 'should destroy skill' do
    assert_difference('Skill.count', -1) do
      delete skill_path(skills(:ruby))
    end

    assert_redirected_to skills_path
  end
end
