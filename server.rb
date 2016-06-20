require 'sinatra'
require 'http'

# set :port, 80



# https://github.com/paypal/ipn-code-samples

post '/' do
  # cmd=_notify-validate
  puts "---1"
  puts params.inspect
  puts "---2"
  # puts request.inspect
  request.body.rewind
  puts request.body.read.inspect
  # params.merge!("cmd" => "_notify-validate")
  puts "---3"
  p = {"cmd" => "_notify-validate"}.merge(params)
  puts p.inspect
  puts "---4"
  
  # response = HTTP.post('https://www.sandbox.paypal.com/cgi-bin/webscr', form: params)
  # response = HTTP.post('https://ipnpb.sandbox.paypal.com/cgi-bin/webscr', form: p )
  request.body.rewind
  response = HTTP.post("https://ipnpb.sandbox.paypal.com/cgi-bin/webscr", body: "cmd=_notify-validate&#{request.body.read}")
  

  puts "response: #{response.inspect}"
  puts "----"
  puts response.to_s
  puts "----"
  puts response.code
  puts "---5"
  
end

# HTTP.post("http://example.com/resource", :body => "foo=42&bar=baz"

get "/*" do
  puts "catch all [get]"
  puts params.inspect
  "bau"
end
