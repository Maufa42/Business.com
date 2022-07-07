require "./product.rb"
require "./pricing_rule.rb"

class Checkout

  attr_accessor :cart

  def initialize()
    @bag = Array.new
  end

  def input_cart
    prod  = Product.new
    prod.view_product

    arr=["001","002","003"]

    bag_size = gets.chomp.to_i
    i=0
    # bag = Array.new
    while i<=bag_size-1 do
      puts "Choose the #{i+1} product: "
      # debugger 
      i=i+1
      input = gets.chomp.to_s
       while !arr.include?(input) do
        puts "Please enter a valid Number(Choose Between [001,002,003])"
        input = gets.chomp.to_s
        # i-=1
         if !arr.include?(input)
          next
         else
          # @bag.append(input)
          break;
         end
      end
      
      @bag.append(input)
    end
  # discount()
  p @bag
  end

  def output_cart
    # I need to call the pricing_rule class here as it return the total 
    price = Pricing.new
    puts price.pricing_rule(@bag)
  end

end
# input = gets.chomp
obj = Checkout.new()
obj.input_cart
obj.output_cart