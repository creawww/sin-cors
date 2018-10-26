require 'sinatra'
require 'sinatra/reloader' if development?
require 'net/http'
require 'json'

get '/' do
  if params["url"]
    url_in= URI.encode_www_form(params)
    content_type :json
    response_url(url_in).to_json
  else
    p "api"
  end
end

#http://localhost:3000/?url=http://www.ffcv.es/ncompeticiones/server.php?action=getEncuentrosEquipo&tmp=2018/2019&id=0201630511

def response_url(url_app)
  n_url=url_app[4..-1]
  uri = URI(URI.unescape(n_url))
  response = Net::HTTP.get(uri)
  JSON.parse(response)
end
