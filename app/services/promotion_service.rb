
class PromotionService
    def initialize
        @config = {
            app_key: "38abcd",
            access_token: "access_token",
            sign: "5361235029d141222525e303d742f9e38aea052d10896d3197ab9d6233730b8c"
        }
        @api_client = ApiClient.new
    end

    def add(params = {})
        url = "/api/promotion/activity/create"
        url << "?app_key=#{@config[:app_key]}"
        url << "&access_token=#{@config[:access_token]}"
        url << "&sign=#{@config[:sign]}"
        url << "&timestamp=#{Time.now.to_i}"

        @api_client.call_api(url, "POST", params)
    end
end
