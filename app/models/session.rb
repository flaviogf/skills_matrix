class Session
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, presence: true

  validates :password, presence: true

  def initialize(attributes = {})
    @email = attributes[:email]
    @password = attributes[:password]
  end

  def authenticate
    User.find_by(email: @email)&.authenticate(@password)
  end
end
