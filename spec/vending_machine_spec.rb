require 'vending_machine'
require 'product'
require 'coin'

describe VendingMachine do

  let(:sugar_rush) { VendingMachine.new }
  let(:inventory) { Product.new }
  let(:money) { Coin.new }

  it 'starts inventory with 5 of each product on initialisation' do
  		expect(inventory.in_stock.values.sum).to eq 20
  end

  it 'starts coin stock with a total of 60 coins on initialisation' do
      expect(money.coins.values.sum).to eq 60
  end
end
