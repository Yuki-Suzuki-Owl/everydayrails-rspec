RSpec::Matchers.define :have_content_type do |expected|
  match do |actual|
    begin
      # content_types = {
      #   html:"text/html",
      #   json:"application/json"
      # }
      actual.content_type == content_types[expected.to_sym]
    rescue ArgumentError
      false
    end
  end
  failure_message do |actual|
    "Expected \"#{content_type(actual.content_type)}" + "(#{actual.content_type})\" to be Content Type" + "\"#{content_type(expected)}\"(#{expected})"
  end

  failure_message_when_negated do |actual|
    "Expected \"#{content_type}\" to not be Content Type" + "\"#{content_type(expected)}\"(#{expected})"
  end

  def content_type(type)
    type = {
      html:"text/html",
      json:"application/json"
    }
    types[type.to_sym] || "unknown content type"
  end
end
