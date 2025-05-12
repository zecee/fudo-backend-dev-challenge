API_VERSION = 'v1'.freeze
API_V1_NAMESPACE = "/api/#{API_VERSION}".freeze

require 'sinatra'
require 'securerandom'
require_relative 'helpers'
require_relative './routes/static_routes'
require_relative "./routes#{API_V1_NAMESPACE}/user_routes"
require_relative "./routes#{API_V1_NAMESPACE}/product_routes"

enable :sessions

after do
  headers 'X-API-Version' => API_VERSION if request.path_info.start_with?(API_V1_NAMESPACE)
end

set :session_secret, SecureRandom.hex(64)

before { content_type 'application/json' }
