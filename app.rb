API_V1_NAMESPACE = '/api/v1'.freeze

require 'sinatra'
require 'securerandom'
require_relative 'helpers'
require_relative './routes/static_routes'
require_relative "./routes#{API_V1_NAMESPACE}/user_routes"
require_relative "./routes#{API_V1_NAMESPACE}/product_routes"

enable :sessions
set :session_secret, SecureRandom.hex(64)

before { content_type 'application/json' }
