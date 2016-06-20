require 'sinatra'
require 'http'

# https://github.com/paypal/ipn-code-samples

post '/' do
  request.body.rewind
  response = HTTP.post("https://ipnpb.sandbox.paypal.com/cgi-bin/webscr", body: "cmd=_notify-validate&#{request.body.read}")
  puts response.to_s
  puts "----"
  puts response.code
end


get "/hello" do
  puts "catch all [get]"
  puts params.inspect
  "Hello World!"
end
