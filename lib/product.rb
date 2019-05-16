class Product
  attr_accessor :in_stock

    def initialize
      @in_stock = {}
      @in_stock = { "Snickers" => 5, "Mars Bar" => 5, "Bounty" => 5, "Kinder Bueno" => 5}
    end
end
