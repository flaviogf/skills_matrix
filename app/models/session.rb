class Session
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, presence: true, email: true

  validates :password, presence: true

  def initialize(attributes={})
    @email = attributes.fetch(:email, '')
    @password = attributes.fetch(:password, '')
  end
end
