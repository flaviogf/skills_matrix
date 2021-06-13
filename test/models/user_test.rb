require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid? should be true when email is valid' do
    user = User.new(email: 'frank@email.com')

    user.valid?

    assert user.errors[:email].empty?
  end

  test 'valid? should be false if email is empty' do
    user = User.new(email: '')

    user.valid?

    assert_not user.errors[:email].empty?
  end

  test 'valid? should be false if e-mail is invalid' do
    user = User.new(email: 'invalid')

    user.valid?

    assert_not user.errors[:email].empty?
  end

  test 'valid? should be true name is valid' do
    user = User.new(name: 'Frank')

    user.valid?

    assert user.errors[:name].empty?
  end

  test 'valid? should be false if name is empty' do
    user = User.new(name: '')

    user.valid?

    assert_not user.errors[:name].empty?
  end

  test 'is_admin? should be true' do
    assert users(:admin).is_admin?
  end

  test 'is_admin? should be false' do
    assert_not users(:regular).is_admin?
  end

  test 'is_staff? should be true' do
    assert users(:regular).is_staff?
  end

  test 'is_staff? should be false' do
    assert_not users(:admin).is_staff?
  end
end
