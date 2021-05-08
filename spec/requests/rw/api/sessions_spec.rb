require 'swagger_helper'

RSpec.describe 'rw/api/sessions', type: :request do
  path '/api/v1/login' do
    post 'login a User' do
      tags 'login'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '422', 'invalid request' do
        let(:blog) { { email: '' } }
        run_test!
      end
    end
  end
end
