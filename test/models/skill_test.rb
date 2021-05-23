require "test_helper"

class SkillTest < ActiveSupport::TestCase
  test 'save should return false when name is empty' do
    csharp = Skill.new name: ''

    assert_not csharp.save
  end
end
