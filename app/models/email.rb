class Email
  def initialize(value)
    @value = value.to_s
  end

  def valid?
    @value =~ /\A[^@\s]+@[^@\s]+\z/
  end

  def to_s
    @value
  end
end
