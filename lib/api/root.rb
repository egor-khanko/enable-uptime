# frozen_string_literal: true

module API
  class Root < Grape::API

    include Defaults

    params do
      requires :name, type: String, desc: 'Hello, world!'
    end
    get :posts do
      { hello: params[:name] }
    end

    add_swagger_documentation(DEFAULT_SWAGGER_OPTIONS)
  end
end
