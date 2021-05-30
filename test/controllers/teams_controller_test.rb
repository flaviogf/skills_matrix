require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test 'index should return ok' do
    get teams_path, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :ok
  end

  test 'index as json should return a list of teams' do
    get teams_path, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    teams = response.parsed_body

    assert_equal 2, teams.size
    assert_equal teams[0]['name'], 'DC'
    assert_equal teams[1]['name'], 'Marvel'
  end

  test 'show should return ok' do
    team = teams(:dc)

    get team_path(team), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :ok
  end

  test 'show should return not found when team does not exist' do
    team = Team.new id: 3, name: 'Vertigo'

    get team_path(team), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :not_found
  end

  test 'show as json should return a team' do
    get team_path(teams(:dc)), as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    team = response.parsed_body

    assert_equal 1, team['id']
    assert_equal 'DC', team['name']
  end

  test 'new should return ok' do
    get new_team_path, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :ok
  end

  test 'edit should return ok' do
    team = teams(:dc)

    get edit_team_path(team), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :ok
  end

  test 'edit should return not found when team does not exist' do
    team = Team.new id: 4, name: 'Vertigo'

    get edit_team_path(team), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :not_found
  end

  test 'create should redirect to created team' do
    request_params = { team: { name: 'Vertigo' } }

    post teams_path, params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_redirected_to team_path(Team.last)
  end

  test 'create should save the new team' do
    request_params = { team: { name: 'Vertigo' } }

    post teams_path, params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    team = Team.last

    assert_equal 3, Team.count
    assert_equal 'Vertigo', team.name
  end

  test 'create should return unprocessable entity when request params is not valid' do
    request_params = { team: { name: '' } }

    post teams_path, params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :unprocessable_entity
  end

  test 'create as json should return status created' do
    request_params = { team: { name: 'Vertigo' } }

    post teams_path, params: request_params, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :created
  end

  test 'create as json should return status unprocessable entity when request params is not valid' do
    request_params = { team: { name: '' } }

    post teams_path, params: request_params, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :unprocessable_entity
  end

  test 'update should redirect to the updated team' do
    request_params = { team: { name: 'Vertigo' } }

    put team_path(teams(:dc)), params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_redirected_to teams(:dc)
  end

  test 'update should save the changes made at the team' do
    request_params = { team: { name: 'Vertigo' } }

    team = teams(:dc)

    put team_path(team), params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    team.reload

    assert_equal 'Vertigo', team.name
  end

  test 'update should return unprocessable entity when request params is not valid' do
    request_params = { team: { name: '' } }

    team = teams(:dc)

    put team_path(team), params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :unprocessable_entity
  end

  test 'update should return not found when team does not exist' do
    request_params = { team: { name: '' } }

    team = Team.new id: 4, name: 'Vertigo'

    put team_path(team), params: request_params, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :not_found
  end

  test 'update as json should return ok' do
    request_params = { team: { name: 'Vertigo' } }

    team = teams(:dc)

    put team_path(team), params: request_params, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :ok
  end

  test 'update as json should return unprocessable entity when request params is not valid' do
    request_params = { team: { name: '' } }

    team = teams(:dc)

    put team_path(team), params: request_params, as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :unprocessable_entity
  end

  test 'destroy should redirect to teams path' do
    team = teams(:dc)

    delete team_path(team), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_redirected_to teams_path
  end

  test 'destroy should delete the team' do
    team = teams(:dc)

    delete team_path(team), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_equal 1, Team.count
  end

  test 'destroy should return not found when team does not exist' do
    team = Team.new id: 4, name: 'Vertigo'

    delete team_path(team), headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :not_found
  end

  test 'destroy as json should return no content' do
    team = teams(:dc)

    delete team_path(team), as: :json, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials(ENV['APP_USER'], ENV['APP_PASS']) }

    assert_response :no_content
  end
end
