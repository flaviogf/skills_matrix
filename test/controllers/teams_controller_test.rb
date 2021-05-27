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
end
