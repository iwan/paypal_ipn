require 'sinatra'
require 'http'

# https://github.com/paypal/ipn-code-samples

post '/' do
  request.body.rewind
  response = HTTP.post("https://ipnpb.sandbox.paypal.com/cgi-bin/webscr", body: "cmd=_notify-validate&#{request.body.read}")
  logger.info "response.to_s: #{response.to_s}"
  logger.info "response.code: #{response.code}"
end


get "/hello" do
  puts "catch all [get]"
  puts params.inspect
  logger.info "aaaaa"
  "Hello World!"
end
