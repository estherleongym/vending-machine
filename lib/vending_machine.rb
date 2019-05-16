require_relative "coin"
require_relative "product"

class VendingMachine

attr_accessor :products, :coin_stock

    def initialize
      @products = (Product.new).in_stock
      @coin_stock = (Coin.new).coins
      @product_selected = ""
      @payment_received = []
    end

    def run
      puts "Good day! Please type what you would like to purchase"
      select_product
    end

    def collect_payment
      coins_inserted = gets.chomp
       while !coins_inserted.empty? do
        @payment_received << coins_inserted
        coins_inserted = gets.chomp
       end
      @payment_received
     calculate_payment(@payment_received)
    end

    def select_product
      puts "We have the following in stock:"
       @products.each { | item, stock_available | puts "#{item}: £1" }
        @product_selected = gets.chomp
       puts "That'll be £1. When you're finished, hit enter twice."
      collect_payment
    end

    def load_change(load)
        load.each{ | coin | @coin_stock[coin] += 1}
       @coin_stock
      @payment_received = []
    end

    def dispense_product
      puts "Here's your #{@product_selected}!"
      deduct_product(@product_selected)
    end

    def dispense_change(change)
      puts "Here's your #{@product_selected} and change of #{change}!"
      deduct_product(@product_selected)
    end

    def request_more_coins(total)
      puts "Uh-oh! That's not enough, please add in more coins"
      collect_payment
    end

    def restock_products
      default_restock = [ "Snickers", "Mars Bar", "Bounty", "Kinder Bueno" ]
      default_restock.each{ | product | @products[product] += 1}
    end

    def restock_coins
      default_restock = [ "£2", "£1", "50p", "20p", "10p", "5p", "2p", "1p" ]
      default_restock.each{ | coin | @coin_stock[coin] += 1}
    end

    private

    def calculate_payment(payment_received)
      total = 0.0
        payment_received.each { | coin |
         coin = value(coin)
        total = total + coin}
       total
      payment_sufficient?(total)
    end

    def payment_sufficient?(total)
      payment = 1.0
      coin_collected = []
       if total == 1
         dispense_product
         load_change(@payment_received)
       elsif total > 1
         load_change(@payment_received)
         calculate_change(total)
       else
         request_more_coins(total)
       end
    end

     def calculate_change(total)
      change_collected = []
       difference = (1.00 - total).abs.round(2)
         while difference != 0.0
           coin_found = @coin_stock.find { | coin, units | value(coin) <= difference && units > 0 }.first
           change_collected << coin_found
           difference = (difference - value(coin_found)).round(2)
         end
         change_collected.each { | coin | @coin_stock[coin] -= 1 }
        @coin_stock
       dispense_change(change_collected)
     end

    def value(coin)
      if coin.end_with?("p")
        coin = coin.tr('p', '').to_f / 100
      else
        coin = coin.tr('£', '').to_f
      end
     coin
    end

    def deduct_product(product)
     @products[product] -= 1
      @products
     @product_selected = ""
    end

    def deduct_change(change)
      change.each { | coin | @coin_stock[coin] -= 1 }
       @coin_stock
      @payment_received = []
    end
end
