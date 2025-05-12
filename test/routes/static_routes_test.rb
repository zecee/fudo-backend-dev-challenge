require_relative '../test_helper'

describe 'App Endpoints' do
  include TestHelper

  describe 'GET /openapi' do
    it 'returns 200 with YAML content and no cache' do
      get '/openapi'
      _(last_response.status).must_equal 200
      _(last_response.content_type).must_match %r{\Atext/yaml}
      _(last_response.headers['Cache-Control']).must_include 'no-store'
      _(last_response.headers['Pragma']).must_equal 'no-cache'
      _(last_response.headers['Expires']).must_equal '0'
    end
  end

  describe 'GET /authors' do
    it 'returns 200 with plain text and cache for 24 hours' do
      get '/authors'
      _(last_response.status).must_equal 200
      _(last_response.content_type).must_match %r{\Atext/plain}
      _(last_response.headers['Cache-Control']).must_equal 'public, max-age=86400'
    end
  end
end
