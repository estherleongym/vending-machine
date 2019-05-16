class Coin

attr_accessor :coins

   def initialize
    @coins = {"£2" => 5,
      			 "£1" => 5,
      			 "50p" => 5,
      			 "20p" => 5,
      			 "10p" => 10,
      			 "5p" => 10,
      			 "2p" => 10,
      			 "1p" => 10}
   end
end
