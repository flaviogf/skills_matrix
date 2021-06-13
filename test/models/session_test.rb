require "test_helper"

class SessionTest < ActiveSupport::TestCase
  test 'should be true if email is valid' do
    session = Session.new(email: 'frank@email.com')

    session.valid?

    assert session.errors[:email].empty?
  end

  test 'should be false if email is empty' do
    session = Session.new(email: '')

    session.valid?

    assert_not session.errors[:email].empty?
  end

  test 'should be false if email is invalid' do
    session = Session.new(email: 'frank')

    session.valid?

    assert_not session.errors[:email].empty?
  end

  test 'should be true if password is valid' do
    session = Session.new(password: 'test')

    session.valid?

    assert session.errors[:password].empty?
  end

  test 'should be false if password is empty' do
    session = Session.new(password: '')

    session.valid?

    assert_not session.errors[:password].empty?
  end
end
