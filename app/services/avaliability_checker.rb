# frozen_string_literal: true

class AvaliabilityChecker
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def check
    return unless response = HTTP.get(url)

    response.status.success?
  end
end
