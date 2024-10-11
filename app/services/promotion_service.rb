
class PromotionService
    def initialize
        @config = {
            app_key: "***",
            access_token: "***",
            sign: "***",
            shop_id: "***"
        }
        @api_client = ApiClient.new
    end

    def add(params = {})
        url = "/api/promotion/activity/create"
        url << "?app_key=#{@config[:app_key]}"
        url << "&timestamp=#{Time.now.to_i}"
        url << "&sign=#{@config[:sign]}"
        url << "&access_token=#{@config[:access_token]}"
        url << "&shop_id=#{@config[:shop_id]}"

        @api_client.call_api(url, "POST", params)
    end
end
