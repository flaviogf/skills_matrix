require "test_helper"

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test 'index should return ok' do
    get teams_path

    assert_response :ok
  end

  test 'index as json should return a list of teams' do
    get teams_path, as: :json

    teams = response.parsed_body

    assert_equal 2, teams.size
    assert_equal teams[0]['name'], 'DC'
    assert_equal teams[1]['name'], 'Marvel'
  end

  test 'show should return ok' do
    team = teams(:dc)

    get team_path(team)

    assert_response :ok
  end

  test 'show should return not found when team does not exist' do
    team = Team.new id: 3, name: 'Vertigo'

    get team_path(team)

    assert_response :not_found
  end

  test 'show as json should return a team' do
    get team_path(teams(:dc)), as: :json

    team = response.parsed_body

    assert_equal 1, team['id']
    assert_equal 'DC', team['name']
  end
end
