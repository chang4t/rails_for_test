require "net/http"
require "uri"
require "json"

class ApiClient
  def initialize
    @base_url = "https://open-api.tiktokglobalshop.com"
  end

  def call_api(endpoint, method = "GET", request_data = {})
    url = URI.join(@base_url, endpoint).to_s
    uri = URI.parse(url)

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == "https")

    request = case method.upcase
    when "POST"
        Net::HTTP::Post.new(uri.path, { "Content-Type" => "application/json" })
    when "GET"
        uri.query = URI.encode_www_form(request_data) if request_data.any?
        Net::HTTP::Get.new(uri)
    when "PUT"
        Net::HTTP::Put.new(uri.path, { "Content-Type" => "application/json" })
    when "DELETE"
        Net::HTTP::Delete.new(uri.path)
    else
        raise "Unsupported HTTP method: #{method}"
    end

    request.body = request_data.to_json unless method.upcase == "GET"
    response = http.request(request)

    case response
    when Net::HTTPSuccess
      JSON.parse(response.body)
    else
      { error: response.message, code: response.code }
    end
  end
end
