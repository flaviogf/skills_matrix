class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors.add(attribute, I18n.t('email_validator.message')) unless Email.new(value).valid?
  end
end
