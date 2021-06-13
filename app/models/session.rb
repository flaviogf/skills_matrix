class Session
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  validates :password, presence: true

  def initialize(attributes={})
    @email = attributes.fetch(:email, '')
    @password = attributes.fetch(:password, '')
  end
end
