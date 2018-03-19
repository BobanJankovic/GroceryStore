class Store
  ## create an inventory with number of items
  attr_accessor :item, :price, :count

  def initialize (item, price, count)
    @item = item
    @price = price
    @count = count

  end
end

Banana = Store.new('Bananas', 0.29, 50)
Orange = Store.new('Oranges', 0.59, 100)
Milk = Store.new('Milk', 2.89, 20)

## to keep the app.rb file a little cleaner, moved this here
#### couldn't quite figure out how show remaining items since
#### it would usually say it was a local variable when I would
#### try to use banana_current
def inventory
  puts "Here's our fresh selection: "
  puts "#{Banana.count} #{Banana.item} (\$#{Banana.price} each)"
  puts "#{Orange.count} #{Orange.item} (\$#{Orange.price} each)"
  puts "#{Milk.count} gallons of #{Milk.item} "\
       "(\$#{Milk.price} each)"
end
