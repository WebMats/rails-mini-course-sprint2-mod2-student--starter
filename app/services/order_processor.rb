class OrderProcessor
    def initialize(order)
        @order = order
        @products = order.products
    end

    def ship
        response = nil
        if products_available? && response = @order.ship
            @products.each { |product| product.reduce_inventory }
            return response
        else
            return false
        end
    end


    private 

    def products_available?
        available = true
        @products.each { |product| !product.available? && available = false }
        available
    end
end