class Order < ApplicationRecord

    def shippable?
        status != "shipped" && products.length > 0
    end

    def products
        product_ids = OrderProduct.where(order_id: id).select(:product_id).map { |op| op.product_id }
        products_for_order = Product.find(product_ids)
    end

    def ship
        if !shippable?
            return false
        else
            update(status: "shipped")
            return true
        end
    end
end
