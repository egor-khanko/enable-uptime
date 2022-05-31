# frozen_string_literal: true

Rswag::Ui.configure do |c|
  c.swagger_endpoint '/api/swagger_doc.json', 'API Default'

  c.basic_auth_enabled = true
  c.basic_auth_credentials ENV.fetch('SWAGGER_USERNAME', 'admin'), ENV.fetch('SWAGGER_PASSWORD', 'password')

  c.config_object[:defaultModelsExpandDepth] = -1
end
