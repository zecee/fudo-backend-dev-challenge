require_relative '../../../models/user'

post "#{API_V1_NAMESPACE}/register" do
  body = parse_request_body
  username = body['username']&.strip
  password = body['password']&.strip

  if username.nil? || password.nil? || username.empty? || password.empty?
    halt 400, { error: 'Username and password are required' }.to_json
  end

  begin
    User.create(username, password)
    status 201
    { message: 'User registered successfully' }.to_json
  rescue StandardError => e
    halt 400, { error: e.message }.to_json
  end
end

post "#{API_V1_NAMESPACE}/auth" do
  body = parse_request_body
  username = body['username']&.strip
  password = body['password']&.strip

  if username.nil? || password.nil? || username.empty? || password.empty?
    halt 400, { error: 'Username and password must be provided' }.to_json
  end

  if User.registered?(username, password)
    session[:username] = username
    { message: 'Authenticated successfully' }.to_json
  else
    halt 401, { error: 'Invalid credentials' }.to_json
  end
end

post "#{API_V1_NAMESPACE}/logout" do
  session.clear
  { message: 'Session closed successfully' }.to_json
end
