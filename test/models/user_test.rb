require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'save should return false when name is empty' do
    user = User.new name: '', email: 'frank@email.com', password: 'test123', password_confirmation: 'test123'

    assert_not user.save
  end

  test 'save should return false when email is empty' do
    user = User.new name: 'frank', email: '', password: 'test123', password_confirmation: 'test123'

    assert_not user.save
  end

  test 'save should return false when email is already taken' do
    frank = User.new name: 'frank', email: 'frank@email.com', password: 'test123', password_confirmation: 'test123'

    frank.save

    fake = User.new name: 'fake', email: 'frank@email.com', password: 'test123', password_confirmation: 'test123'

    assert_not fake.save
  end

  test 'save should return false when password is empty' do
    user = User.new name: 'frank', email: 'frank@email.com', password: '', password_confirmation: 'test123'

    assert_not user.save
  end

  test 'save should return false when password and password_confirmation do not match' do
    user = User.new name: 'frank', email: 'frank@email.com', password: 'test123', password_confirmation: 'test1234'

    assert_not user.save
  end

  test 'equal? should be true' do
    user1 = users(:frank)

    user2 = users(:frank)

    assert user1.equal?(user2)
  end

  test 'equal? should be false' do
    user1 = users(:frank)

    user2 = users(:peter)

    assert_not user1.equal?(user2)
  end
end
