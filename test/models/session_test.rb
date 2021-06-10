require 'test_helper'

class SessionTest < ActiveSupport::TestCase
  test 'valid? should be false if email is empty' do
    session = Session.new email: '', password: 'test123'
    assert_not session.valid?
  end

  test 'valid? should be false if password is empty' do
    session = Session.new email: 'frank@email.com', password: ''
    assert_not session.valid?
  end
end
