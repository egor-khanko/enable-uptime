# frozen_string_literal: true

module API
  class Root < Grape::API
    include Defaults

    prefix :api
    mount Resources::MonitoredServices
    mount Resources::Recipients

    add_swagger_documentation(DEFAULT_SWAGGER_OPTIONS)
  end
end
