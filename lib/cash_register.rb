require 'pry'

class CashRegister

    attr_reader :items, :discount
    attr_accessor :total, :items, :previous

    def initialize(discount = 0)
        @total = 0.0
        @discount = discount.to_f
        @items = []
        @previous = 0.0
    end

    def add_item(item, price, quantity = 1)
        self.previous = self.total
        self.total += price * quantity
        # self.items = self.items << { item: item, price: price, quantity: quantity}
        quantity.times { self.items << item }
    end

    def apply_discount
        if self.discount == 0.0
            return "There is no discount to apply."
        else
            self.total -= self.total * ( self.discount / 100 )
            p "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.total = self.previous
    end
end
