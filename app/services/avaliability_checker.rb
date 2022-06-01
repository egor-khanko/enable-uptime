# frozen_string_literal: true

class AvaliabilityChecker
  attr_reader :url

  def initialize(url)
    @url = url
  end

  def check
    raise NotImplementedError
  end
end
