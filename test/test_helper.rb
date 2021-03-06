ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

module SignInHelper
  def sign_in(user, password='test')
    post sessions_path, params: { session: { email: user.email, password: password } }
  end
end

module SignOutHelper
  def sign_out
    delete sessions_path
  end
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include SignInHelper
  include SignOutHelper
end
