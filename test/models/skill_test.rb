require "test_helper"

class SkillTest < ActiveSupport::TestCase
  test 'should not save a skill with empty name' do
    csharp = Skill.new name: ''

    assert_not csharp.save
  end
end
