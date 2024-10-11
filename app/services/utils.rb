require "uri"

class Utils
    def initialize
    end

    def make_sign_option (query_param = "", secret, body_data)
        # Extract all query parameters excluding sign and access_token 
        uri = URI.parse(query_param)
        query_params = URI.decode_www_form(uri.query).to_h
        query_params = query_params.except("sign", "access_token")
        query_params = query_params.sort.to_h

        # Join param
        string_to_sign = query_params.map { |key, value| "#{key}#{value}" }.join

        # Add path url
        string_to_sign = uri.path + string_to_sign

        # Join with body if not nil
        string_to_sign += body_data.to_json if body_data.present?

        # Wrap the string with the app_secret
        string_to_sign = secret + string_to_sign + secret
        puts string_to_sign

        # Hash Sha256
        digest = OpenSSL::Digest.new("sha256")
        OpenSSL::HMAC.hexdigest(digest, secret, string_to_sign)
    end
end