module LinkHelper
  HOST_REGEX = Regexp.new (ENV["DOMAIN"] || "localhost:3000")

  def self.external_link?(link)
    not link.start_with?('#') or link.start_with?('/') or link =~ HOST_REGEX
  end
end
