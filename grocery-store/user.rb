class User
  attr_accessor :name, :money

  def initialize
    ## gather user's name and how much they want to spend today
    puts ""
    puts "Thanks for visiting TJ's online grocery store!"
    puts "What's your name?"
    @name = gets.strip.to_s
    puts ""
    puts "Hey #{@name}! How much are you looking to spend today?"
    @money = gets.strip.to_i
    puts ""

    if @money < 0.01
      puts "Try entering your amount again w/o a dollar sign"
      @money = gets.strip.to_i
    end
    
    ## for some reason, decimal points won't show here
    ## even when I put .round(2)
    puts ""
    puts "Ok #{@name}, looks like you have \$#{@money}"\
         " to buy great food."
  end

end

User_info = User.new
