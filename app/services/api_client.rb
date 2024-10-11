require "httparty"

class ApiClient
  include HTTParty
  base_uri "https://open-api.tiktokglobalshop.com"

  def initialize
  end

  def call_api(endpoint, method = :get, request_data = {})
    options = {
      body: request_data.to_json,
      headers: { "Content-Type" => "application/json" }
    }

    puts "https://open-api.tiktokglobalshop.com" + endpoint
    response = self.class.send(method, endpoint, options)
    handle_response(response)
  end

  private

  def handle_response(response)
    case response.code
    when 200..299
      { code: response.code, message: response.parsed_response }
    else
      { code: response.code, error: response.message, message: response.parsed_response }
    end
  end
end
