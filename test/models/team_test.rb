require "test_helper"

class TeamTest < ActiveSupport::TestCase
  test 'save should return false when name is empty' do
    team = Team.new name: ''

    assert_not team.save
  end
end
