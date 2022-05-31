# frozen_string_literal: true

module API::Defaults
  extend ActiveSupport::Concern

  DEFAULT_SWAGGER_OPTIONS = {
    info: {
      title: 'Enable-tracker API'
    },
    security_definitions: { # add api token here after adding authorization
    },
    security: [
      {
        token: []
      }
    ],
    mount_path: 'api/swagger_doc.json',
    models: [],
    array_use_braces: true
  }.freeze

  included do
    format :json
  end
end
