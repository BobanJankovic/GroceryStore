require_relative 'user.rb'
require_relative 'store.rb'

spacer = puts ""

puts inventory

while true
  puts """
    What would you like to do?
    Press 1, 2, 3, or 4
    1. Buy item(s)
    2. View cart
    3. Checkout
    4. Leave store
  """
  
  store_choice = gets.strip.to_i
  case store_choice

  when 1
  puts  "That's great, what would you like to buy?"
  puts spacer
  puts inventory
  puts "Press 1 for #{Banana.item}, "\
       "Press 2 for #{Orange.item}, "\
       "Press 3 for #{Milk.item}"
    
    buy_item = gets.strip.to_i
    #### need to come back and fix with additional if
    #### to not let it go negative
    if buy_item == 1
      puts spacer
      puts "How many #{Banana.item}?"
      puts "(#{Banana.count} available)"
      banana_purchase = gets.strip.to_i
      banana_current = Banana.count - banana_purchase
      puts "We have #{banana_current} #{Banana.item} left."
    end

    if buy_item == 2
      puts spacer
      puts "How many #{Orange.item}?"
      puts "(#{Orange.count} available)"
      orange_purchase = gets.strip.to_i
      orange_current = Orange.count - orange_purchase
      puts "We have #{orange_current} #{Orange.item} left."
    end

    if buy_item == 3
      puts spacer
      puts "How many gallon(s) of #{Milk.item}?"
      puts "(#{Milk.count} available)"
      milk_purchase = gets.strip.to_i
      milk_current = Milk.count - milk_purchase
      puts "We have #{milk_current} gallon(s) left."
    end

  #### wanted to use a case inside another case
  #### but when user triggered exit, it closed
  #### the whole app, not just that case...
  # while true
  #   puts """
  #     Press 1, 2, 3 or 4
  #     1. Bananas
  #     2. Oranges
  #     3. Milk
  #     4. Go back
  #   """
  # purchase_choice = gets.strip.to_i
  # case purchase_choice
  # when 1
  #   puts "How many?"
  #   banana_purchase = gets.to_i
  # when 2
  #   puts "How many?"
  #   orange_purchase = gets.to_i
  # when 3
  #   puts "How many gallons?"
  #   milk_purchase = gets.to_i
  # when 4
  #   exit.purchase_choice
  #   end
  # end

  cart_total = banana_purchase.to_i * Banana.price + 
               orange_purchase.to_i * Orange.price + 
               milk_purchase.to_i * Milk.price

  when 2
  puts "Here's what you have so far:"
  puts "#{banana_purchase.to_i} #{Banana.item}, "\
       "#{orange_purchase.to_i} #{Orange.item}, "\
       "and #{milk_purchase.to_i} gallon(s) of #{Milk.item}."
  puts "Current total: \$#{cart_total.round(2)}"
  puts "Your budget: \$#{User_info.money}"

  when 3
  puts "This is a great order! Here's what you're getting:"
  #### need to put in price of each item * purchase amount
  puts "#{banana_purchase.to_i} #{Banana.item}, "\
  "#{orange_purchase.to_i} #{Orange.item}, "\
  "and #{milk_purchase.to_i} gallon(s) of #{Milk.item}"
  puts "Total price: \$#{cart_total.round(2)}"
  puts "Your budget: \$#{User_info.money}"
  
  if cart_total > User_info.money
    puts spacer
    puts "Looks like you have too much in your cart"
    puts "You may put fewer items in your cart by "\
         "going back to \"Buy item(s)\""
  end
  
  if cart_total <= User_info.money
  puts spacer
  puts "Press enter/return to confirm purchase."
  #### need to put in confirm or cancel here
  #### exit needs to sit under if statement 
  #### or it will close everything if they cancel

    confirm_order = gets
    if confirm_order == "\n"
      puts "Thanks for buying from TJ's online grocery store."
      puts "Have a great day and come again soon!" 
      puts spacer
      exit
    else
      puts spacer
      puts "Going to add more? ;)"
    end
  end

  when 4
  exit

  end
end
