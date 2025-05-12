require_relative '../../../models/product'

get "#{API_V1_NAMESPACE}/products" do
  protected!

  return Product.all.to_json if params['gzip'] != 'true'

  compressed = StringIO.new
  gz = Zlib::GzipWriter.new(compressed)
  gz.write(Product.all.to_json)
  gz.close

  content_type 'application/gzip'
  attachment 'data.json.gz'
  compressed.string
end

post "#{API_V1_NAMESPACE}/products" do
  protected!

  body = parse_request_body
  name = body['name']&.strip

  halt 400, { error: 'Product name is required' }.to_json if name.nil? || name.empty?

  Thread.new do
    sleep 5
    Product.create(name)
  end

  status 202
  { message: 'Creation in progress' }.to_json
end
