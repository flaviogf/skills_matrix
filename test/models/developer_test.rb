require "test_helper"

class DeveloperTest < ActiveSupport::TestCase
  test 'should be true if email is valid' do
    developer = Developer.new(email: 'frank@email.com')

    developer.valid?

    assert developer.errors[:email].empty?
  end

  test 'should be false if email is empty' do
    developer = Developer.new(email: '')

    developer.valid?

    assert_not developer.errors[:email].empty?
  end

  test 'should be false if email is not valid' do
    developer = Developer.new(email: 'frank')

    developer.valid?

    assert_not developer.errors[:email].empty?
  end

  test 'should be false if email is already taken' do
    developer = Developer.new(email: 'peter@email.com')

    developer.valid?

    assert_not developer.errors[:email].empty?
  end
end
