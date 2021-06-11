require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test 'valid? should be true when email is valid' do
    session = Session.new(email: 'frank@email.com')

    session.valid?

    assert session.errors[:email].empty?
  end

  test 'valid? should be false when email is empty' do
    session = Session.new(email: '')

    session.valid?

    assert_not session.errors[:email].empty?
  end

  test 'valid? should be false when email is not valid' do
    session = Session.new(email: 'frank')

    session.valid?

    assert_not session.errors[:email].empty?
  end

  test 'valid? should be true when password is valid' do
    session = Session.new(password: 'test')

    session.valid?

    assert session.errors[:password].empty?
  end

  test 'valid? should be false when password is empty' do
    session = Session.new(password: '')

    session.valid?

    assert_not session.errors[:password].empty?
  end
end
