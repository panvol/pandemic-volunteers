# frozen_string_literal: true

module LinkHelper
  HOST_REGEX = Regexp.new(ENV['DOMAIN'] || 'localhost:3000')

  def self.external_link?(link)
    !link.start_with?('#') || link.start_with?('/') || link =~ HOST_REGEX
  end
end
