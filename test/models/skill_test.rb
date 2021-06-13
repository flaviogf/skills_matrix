require "test_helper"

class SkillTest < ActiveSupport::TestCase
  test 'should be true if name is valid' do
    skill = Skill.new(name: 'ruby')

    skill.valid?

    assert skill.errors[:name].empty?
  end

  test 'should be false if name is empty' do
    skill = Skill.new(name: '')

    skill.valid?

    assert_not skill.errors[:name].empty?
  end
end
