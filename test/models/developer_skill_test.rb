require "test_helper"

class DeveloperSkillTest < ActiveSupport::TestCase
  test 'should be true if points is between 0 and 5' do
    0.upto(5) do |i|
      developer_skill = DeveloperSkill.new(points: i)

      developer_skill.valid?

      assert developer_skill.errors[:points].empty?
    end
  end

  test 'should be false if points is less than 0' do
    developer_skill = DeveloperSkill.new(points: -1)

    developer_skill.valid?

    assert_not developer_skill.errors[:points].empty?
  end

  test 'should be false if points is greater than 5' do
    developer_skill = DeveloperSkill.new(points: 6)

    developer_skill.valid?

    assert_not developer_skill.errors[:points].empty?
  end
end
