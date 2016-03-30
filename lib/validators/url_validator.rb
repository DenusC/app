class UrlValidator <  ActiveModel::EachValidator
  URL_EXP = /\Ahttp(s)?:\/\/(\w+?\.)+?\w+?(:\d+)?(\/[\w\d]+)*(\/)?\z/
  def validate_each(record, attribute, value)
    unless URL_EXP =~ value
      record.errors[attribute.to_sym] << (options[:message] || "is not a valid url")
    end
  end
end
