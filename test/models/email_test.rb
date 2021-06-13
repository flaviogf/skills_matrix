class EmailTest < ActiveSupport::TestCase
  test 'should be true' do
    email = Email.new('frank@email.com')

    assert email.valid?
  end

  test 'should be false if email is empty' do
    email = Email.new('')

    assert_not email.valid?
  end

  test 'should be false if email is invalid' do
    email = Email.new('frank')

    assert_not email.valid?
  end

  test 'should return value' do
    email = Email.new('frank@email.com')

    assert_equal 'frank@email.com', email.to_s
  end
end
