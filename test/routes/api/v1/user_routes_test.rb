require_relative '../../../test_helper'

describe 'User Routes' do
  include TestHelper

  describe 'POST /api/v1/register' do
    it 'returns 201 when registering a new user' do
      post '/api/v1/register', { username: 'nuevo', password: 'clave' }.to_json, json_headers
      _(last_response.status).must_equal 201
      _(last_response.content_type).must_equal 'application/json'
    end

    it 'returns 400 when username or password is missing' do
      post '/api/v1/register', {}.to_json, json_headers
      _(last_response.status).must_equal 400
      _(last_response.content_type).must_equal 'application/json'
    end

    it 'returns 400 when username already exists' do
      post '/api/v1/register', { username: 'zece', password: '1234' }.to_json, json_headers
      _(last_response.status).must_equal 400
      _(last_response.content_type).must_equal 'application/json'
    end
  end

  describe 'POST /api/v1/auth' do
    it 'returns 200 when credentials are correct' do
      post '/api/v1/auth', { username: 'zece', password: '1234' }.to_json, json_headers
      _(last_response.status).must_equal 200
      _(last_response.content_type).must_equal 'application/json'
      _(last_response.headers['Set-Cookie']).must_match(/rack\.session=/)
    end

    it 'returns 401 when credentials are invalid' do
      post '/api/v1/auth', { username: 'zece', password: 'wrong' }.to_json, json_headers
      _(last_response.content_type).must_equal 'application/json'
      _(last_response.status).must_equal 401
    end
  end

  describe 'POST /api/v1/logout' do
    it 'returns 200 after session is cleared' do
      post '/api/v1/auth', { username: 'zece', password: '1234' }.to_json, json_headers
      post '/api/v1/logout'
      _(last_response.status).must_equal 200
      _(last_response.content_type).must_equal 'application/json'
    end
  end
end
