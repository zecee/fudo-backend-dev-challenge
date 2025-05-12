ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'rack/test'
require_relative '../app'

module TestHelper
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def json_headers
    { 'CONTENT_TYPE' => 'application/json' }
  end

  def clear_cookies
    rack_mock_session.clear_cookies
  end
end
