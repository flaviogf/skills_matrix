require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test 'index should return success' do
    get skills_path, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :success
  end

  test 'index as json should return success' do
    get skills_path, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :success
  end

  test 'index as json should return a list of skills' do
    get skills_path, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    skills = @response.parsed_body

    assert_equal 3, skills.size

    assert_equal 1, skills[0]['id']
    assert_equal 'Go', skills[0]['name']
  end

  test 'show should return success' do
    get skill_path(skills(:go)), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :success
  end

  test 'show as json should return a skill' do
    get skill_path(skills(:go)), as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    skill = @response.parsed_body

    assert_equal 1, skill['id']
    assert_equal 'Go', skill['name']
  end

  test 'show should return not found when skill does not exist' do
    csharp = Skill.new id: 4, name: 'C#'

    get skill_path(csharp), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :not_found
  end

  test 'new should return success' do
    get new_skill_path, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :success
  end

  test 'edit should return success' do
    get edit_skill_path(skills(:go)), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :success
  end

  test 'edit should return not found when skill does not exist' do
    csharp = Skill.new id: 4, name: 'C#'

    get edit_skill_path(csharp), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :not_found
  end

  test 'create should redirect to the created skill' do
    request_params = { skill: { name: 'C#' } }

    post skills_path, params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_redirected_to edit_skill_path(Skill.last)
  end

  test 'create should save the skill' do
    request_params = { skill: { name: 'C#' } }

    post skills_path, params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_equal 4, Skill.count

    skill = Skill.last

    assert_equal 'C#', skill.name
  end

  test 'create should return unprocessable entity when request params is not valid' do
    request_params = { skill: { name: '' } }

    post skills_path, params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :unprocessable_entity
  end

  test 'create as json should return created' do
    request_params = { skill: { name: 'C#' } }

    post skills_path, params: request_params, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :created
  end

  test 'create as json should return status unprocessable entity when request params is not valid' do
    request_params = { skill: { name: '' } }

    post skills_path, params: request_params, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :unprocessable_entity
  end

  test 'update should redirect to the updated skill' do
    skill = skills(:go)

    request_params = { skill: { name: 'C#' } }

    put skill_path(skill), params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_redirected_to edit_skill_path(skill)
  end

  test 'update should save the changes made at skill' do
    skill = skills(:go)

    request_params = { skill: { name: 'C#' } }

    put skill_path(skill), params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    skill.reload

    assert_equal 'C#', skill.name
  end

  test 'update should return unprocessable entity when request params is not valid' do
    skill = skills(:go)

    request_params = { skill: { name: '' } }

    put skill_path(skill), params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :unprocessable_entity
  end

  test 'update as json should return ok' do
    skill = skills(:go)

    request_params = { skill: { name: 'C#' } }

    put skill_path(skill), params: request_params, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :ok
  end

  test 'update as json should return unprocessable entity when request params is not valid' do
    skill = skills(:go)

    request_params = { skill: { name: '' } }

    put skill_path(skill), params: request_params, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :unprocessable_entity
  end

  test 'destroy should redirect to skills path' do
    skill = skills(:go)

    delete skill_path(skill), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_redirected_to skills_path
  end

  test 'destroy should delete the skill' do
    skill = skills(:go)

    delete skill_path(skill), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_equal 2, Skill.count
  end

  test 'destroy as json should return no content' do
    skill = skills(:go)

    delete skill_path(skill), as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :no_content
  end

  test 'index should return unauthorized when authorization header is not passed' do
    get skills_path

    assert_response :unauthorized
  end
end
