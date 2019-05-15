class VendingMachine

  def initialize(products: Product.new, change: Coin.new)
    @coins_inserted = []
    @product_selected = ""
    puts "Good day! Please type what you would like to purchase"
    self.list_products
  end

private
  def list_products
    puts "We have #{@products}"
    puts "Each candy bar is £1"
  end
end
