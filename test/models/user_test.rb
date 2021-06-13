require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'should be true if email is valid' do
    user = User.new(email: 'frank@email.com')

    user.valid?

    assert user.errors[:email].empty?
  end

  test 'should be false if email is empty' do
    user = User.new(email: '')

    user.valid?

    assert_not user.errors[:email].empty?
  end

  test 'should be false if email is invalid' do
    user = User.new(email: 'frank')

    user.valid?

    assert_not user.errors[:email].empty?
  end
end
