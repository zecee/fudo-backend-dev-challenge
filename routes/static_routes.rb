get '/openapi' do
  content_type 'text/yaml'
  headers 'Cache-Control' => 'no-store, no-cache, must-revalidate, max-age=0',
          'Pragma' => 'no-cache',
          'Expires' => '0'
  send_file 'openapi.yaml'
end

get '/authors' do
  content_type 'text/plain'
  headers 'Cache-Control' => 'public, max-age=86400'
  send_file 'AUTHORS'
end
