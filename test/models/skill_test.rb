require "test_helper"

class SkillTest < ActiveSupport::TestCase
  test 'valid? should be true if name is valid' do
    skill = Skill.new(name: 'Ruby')

    skill.valid?

    assert skill.errors[:name].empty?
  end

  test 'valid? should be false if name is empty' do
    skill = Skill.new(name: '')

    skill.valid?

    assert_not skill.errors[:name].empty?
  end
end
