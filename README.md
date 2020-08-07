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

Provide the functional design of software that controls a Vending Machine. The Vending Machine has a predefined set of items that the user can purchase using cash.
The vending machine has the following actions:

* User inserts cash
* User selects item
* Item is dispensed if enough money has been inserted
* Change is dispensed
* Coin denominations accepted:
  * Quarter = 25 cents
  * Dime = 10 cents
  * Nickel = 5 cents
  * Penny = 1 cent

The first two actions shoud be allowed in any imaginable order, for example:

* User may select item first, then insert enough coins to dispense it.
* User may insert enough coins, then select an item.
* 👆 And **any combinations** of these 2 actions.
  * If they select a different item **after** they've already inserted some coins, the "Sale Price" should change to that item. They should be required to insert that much money. They can select a different item as many times as they want.


### Your Task

1. Write a program that emmulates the Vending Machine.
  1. Choose whatever input method you prefer. CLI is fine, or simulated input from a Test.
1. Implement a method dispense_change()
