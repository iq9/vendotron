# by: Russell Brooks
# me@russbrooks.com

#Provide the functional design of software that controls a vending machine.
#The vending machine has a predefined set of items that the user can purchase using cash.
#The vending machine has the following actions:

#User inserts cash
#User selects item
#Item dispensed if available
#Change dispensed
#Coin denominations reference:
#Quarter = 25 cents; Dime = 10 cents; Nickel = 5 cents; Penny = 1 cent
#The first two actions can be done in interchangeable order - i.e. the user can either select
#the item first and the item will be dispensed when there is enough cash inserted,
#or the user can insert cash and then select the item which will be dispensed
#if the proper amount has been inserted.

#Your task is:

#Design the structure of the program that controls the vending machine
#Implement a method dispenseChange()

class VendingMachine
  def initialize
    # Ruby's is bad at Currency unless you use the "money" gem.
    # Rounding problems. Recommended workaround is to use Cents
    # integers for all math. Then format as Decimal for display only.

    @selected_item_total = 0
    @total_inserted = 0

    @items = [
      { key: '1', name: 'Clark Bar', price: 100 },
      { key: '2', name: 'Snikers', price: 150 },
      { key: '3', name: 'Mounds', price: 200 },
      { key: '4', name: 'Almond Joy', price: 225 },
      { key: '5', name: 'Skør', price: 250 }
    ]

    @denominations = [
      { key: 'p', name: 'Penny', cents: 1 },
      { key: 'n', name: 'Nickel', cents: 5 },
      { key: 'd', name: 'Dime', cents: 10 },
      { key: 'q', name: 'Quarter', cents: 25 }
    ]

    loop do
      display_selections
      @selection = get_selection

      allowed_items = @items.map { |key| key.values[0] }
      allowed_denominations = @denominations.map { |key| key.values[0] }

      if allowed_denominations.include? @selection
        den = @denominations.find { |d| d[:key] == @selection }

        @total_inserted += den[:cents]

        puts '----------'
        puts "Adding Coin: #{to_currency(den[:cents])}"
        puts '----------'
      elsif allowed_items.include? @selection
        item = @items.find { |i| i[:key] == @selection }

        @selected_item_total = item[:price]
        @selected_item = item
      else
        puts 'Invalid selection.'
      end

      unless @selected_item.nil?
        puts "Selected Item: #{@selected_item[:name]}"
        puts "Price: #{to_currency(@selected_item[:price])}"
      end

      unless @total_inserted.nil?
        puts "Total Inserted: #{to_currency(@total_inserted)}"
      end

      puts '==========='

      break if @selected_item_total != 0 && @total_inserted != 0 && @total_inserted >= @selected_item_total
    end

    dispense_change
  end

  def display_selections
    @items.each_with_index do |item, i|
      stdout = "#{i + 1} - #{item[:name]}: #{to_currency(item[:price])}"

      if i < 4
        stdout += "\t#{@denominations[i][:key]} - #{@denominations[i][:name]}: #{@denominations[i][:cents]}¢"
      end

      puts stdout
    end
  end

  def get_selection
    puts ''
    puts 'Make a selection or insert coins.'
    puts ''

    gets.chomp.downcase
  end

  def dispense_change
    change_in_cents = @total_inserted - @selected_item_total

    puts "Item dispensed for: #{to_currency(@selected_item_total)}"
    puts "Change: #{to_currency(change_in_cents)}"
    puts '==========='
  end

  private

    def to_currency(cents)
      # Would be placed into a Currency utility class somewhere more central.
      "$%.2f " % (cents.to_f / 100)
    end
end

vend = VendingMachine.new
