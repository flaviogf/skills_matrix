class Session
  include ActiveModel::Model

  attr_reader :email, :password

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  validates :password, presence: true

  def initialize(attributes={})
    @email = attributes[:email]
    @password = attributes[:password]
  end
end
