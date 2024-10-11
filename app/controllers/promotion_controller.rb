class PromotionController < ApplicationController
  def initialize
    @service = PromotionService.new
    @message = "Welcome to first page of promotion"
  end

  def index
  end

  def add
    # Make request data to send to API
    begin_time = Time.parse("2024-10-11 22:00:00")
    end_time = Time.parse("2024-10-12 00:00:00")

    data = {
      "begin_time": begin_time.to_i,
      "end_time": end_time.to_i,
      "product_type": 1,
      "promotion_type": 1,
      "request_serial_no": "create202208291503530001100220033",
      "title": "DiscountEvent1011"
    }

    begin
      result = @service.add(data)
      if result.respond_to?(:code) && result.code == 200
        @message = result.as_json.to_s
      else
        @message = "Failed to add promotion: #{result.as_json}"
      end

    rescue StandardError => e
      @message = "An error occurred: #{e.message}"
    end

    render :index
  end

  def update
  end

  def remove
  end

  def get
  end
end
