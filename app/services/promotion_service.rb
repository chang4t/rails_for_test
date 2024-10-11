
require "json"

class PromotionService
    def initialize
        @config = {
            app_key: "xxx",
            app_secret: "xxx",
            access_token: "xxx",
            shop_cipher: "xxx",
            shop_id: "xxx"
        }
        @api_client = ApiClient.new
        @util = Utils.new
    end

    def add(params = {})
        # Define info
        timestamp = Time.now.to_i

        # Make URL
        path = "/api/promotion/activity/create"
        path << "?app_key=#{@config[:app_key]}"
        path << "&timestamp=#{timestamp}"
        path << "&access_token=#{@config[:access_token]}"
        path << "&version=202212"
        path << "&shop_cipher=#{@config[:shop_cipher]}"
        path << "&shop_id=#{@config[:shop_id]}"

        # Make sign option
        sign = @util.make_sign_option(path, @config[:app_secret], params)
        path << "&sign=#{sign}"

        # Call API
        @api_client.call_api(path, :post, params)
    end
end
