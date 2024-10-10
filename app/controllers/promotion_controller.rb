class PromotionController < ApplicationController
  def initialize
    @message = "Welcome to first page of promotion"
  end

  def index
  end

  def add
    # Make request data to send to API
    data = {
      "begin_time": 1661756811,
      "end_time": 1661856811,
      "product_type": 1,
      "promotion_type": 1,
      "request_serial_no": "create202208291503530001100220033",
      "title": "DiscountEvent0829"
    }
    service = PromotionService.new

    begin
      result = service.add(data)
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
