require_relative '../../../test_helper'

describe 'Product Routes' do
  include TestHelper

  before do
    post '/api/v1/auth', { username: 'zece', password: '1234' }.to_json, json_headers
  end

  describe 'GET /api/v1/products' do
    it 'returns 200 with JSON when not requesting gzip' do
      get '/api/v1/products'
      _(last_response.status).must_equal 200
      _(last_response.content_type).must_equal 'application/json'
    end

    it 'returns 200 with gzip when requested' do
      get '/api/v1/products?gzip=true'
      _(last_response.status).must_equal 200
      _(last_response.content_type).must_equal 'application/gzip'
      _(last_response.headers['Content-Disposition']).must_include 'attachment'
    end

    it 'returns 401 if not authenticated' do
      clear_cookies
      get '/api/v1/products'
      _(last_response.status).must_equal 401
      _(last_response.content_type).must_equal 'application/json'
    end
  end

  describe 'POST /api/v1/products' do
    it 'returns 202 when product creation is accepted' do
      post '/api/v1/products', { name: 'Nuevo Producto' }.to_json, json_headers
      _(last_response.status).must_equal 202
      _(last_response.content_type).must_equal 'application/json'
      _(last_response.body).must_include 'Creation in progress'
    end

    it 'returns 400 when name is missing' do
      post '/api/v1/products', {}.to_json, json_headers
      _(last_response.status).must_equal 400
      _(last_response.content_type).must_equal 'application/json'
      _(last_response.body).must_include 'Product name is required'
    end

    it 'returns 401 if not authenticated' do
      clear_cookies
      post '/api/v1/products', { name: 'Otro Producto' }.to_json, json_headers
      _(last_response.content_type).must_equal 'application/json'
      _(last_response.status).must_equal 401
    end
  end
end
