helpers do
  def current_user
    session[:username]
  end

  def protected!
    halt 401, { error: 'Unauthorized. Please log in.' }.to_json unless current_user
  end

  def parse_request_body
    JSON.parse(request.body.read)
  rescue JSON::ParserError
    halt 400, { error: 'Request body must be valid JSON' }.to_json
  end
end
