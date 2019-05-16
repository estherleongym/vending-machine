# Vending-Machine

This is a command line program for a simple vending machine.

## Requirements

- Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product
- It should also return change if too much money is provided, or ask for more money if insufficient funds have been inserted
- The machine should take an initial load of products and change. The change will be of denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2
- There should be a way of reloading either products or change at a later point
- The machine should keep track of the products and change that it contains

## How to run it

```
cd vending-machine
irb
require './lib/vendig_machine.rb'
vending_machine = VendingMachine.new
vending_machine.run```

## Commands

- Restocking products

```vending_machine.restock_products```

- Restocking coins

```vending_machine.restock_coins```

- View inventory

```vending_machine.products```

- View change available

```vending_machine.coin_stock```
