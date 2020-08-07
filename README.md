# VendoTron

Vending Machine coding challenge

## Running

Clone this repo, and from its root dir:

```:bash
$ ruby cli.rb
```

## Screenshots

![Screen Shot 2020-08-07 at 2 59 46 PM](https://user-images.githubusercontent.com/214047/89679225-b2995300-d8be-11ea-9d00-6978598eaf4c.png)

## Specs

Provide the functional design of software that controls a vending machine. The vending machine has a predefined set of items that the user can purchase using cash.
The vending machine has the following actions:

* User inserts cash
* User selects item
* Item dispensed if available
* Change dispensed
* Coin denominations accepted:
  * Quarter = 25 cents; Dime = 10 cents; Nickel = 5 cents; Penny = 1 cent

The first two actions can be done in interchangeable order - i.e. the user can either select the item first and the item will be dispensed when there is enough cash inserted, or the user can insert cash and then select the item which will be dispensed if the proper amount has been inserted.

### Your Task

1. Design the structure of the program that controls the vending machine
1. Implement a method dispense_change()
