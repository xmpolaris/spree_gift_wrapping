module Spree
  class GiftWrappingRate < Struct.new(:id, :wrapping_method, :description, :image, :cost, :currency)
    def initialize(attributes = {})
      attributes.each do |k, v|
        self.send("#{k}=", v)
      end
    end

    def display_price
      price = cost

      Spree::Money.new(price, { :currency => currency })
    end
  end
end
