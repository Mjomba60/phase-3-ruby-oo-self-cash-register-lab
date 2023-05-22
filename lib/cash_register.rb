require 'pry'

class CashRegister

    attr_reader :discount, :items
    attr_accessor :total

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @items = []
        @shopped_items = []
    end

    def add_item(title, price, quantity = 1)
        @shopped_items << {title: title, price: price, quantity: quantity, item_total: price*quantity}
        @total += price * quantity
        quantity.times {|i| self.items.push(title)}
    end

    def apply_discount

        self.total -= self.total*self.discount/100
        self.discount == 0 ? "There is no discount to apply." : "After the discount, the total comes to $#{self.total}."
        
    end

    def void_last_transaction
        @shopped_items.pop
        self.total = @shopped_items.length == 0 ? 0.0 : @shopped_items.sum {|ele| ele[:item_total]}
    end
end
