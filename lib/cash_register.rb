require "pry"

class CashRegister

  attr_accessor :items, :discount, :total, :cart

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(item, price, quantity = 1)
    item_info = {}
    item_info[:name] = item
    item_info[:price] = price
    item_info[:quantity] = quantity
    @total += (price * quantity)
    @cart << item_info
  end

  def apply_discount
    if @discount == 0
      return "There is no discount to apply."
    end
    @total -= @total * @discount / 100
    return "After the discount, the total comes to $#{total}."
  end

  def items
    item_names = []
    @cart.each do | item_info |
      for qty in 1..item_info[:quantity]
        item_names << item_info[:name]
      end
    end
    item_names
  end

  def void_last_transaction
    void_amount = self.cart[-1][:price] * self.cart[-1][:quantity]
    @total -= void_amount
    @cart.pop
  end
binding.pry
end