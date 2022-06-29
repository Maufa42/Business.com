
=begin
Heelo This is Great Going 
business.com is an online marketplace, here is a sample of
some of the products available on our site:
Product code | Name | Price
----------------------------------------------------------
001 | Travel Card Holder | $9.25
002 | Personalised cufflinks | $45.00
003 | Kids T-shirt | $19.95
Our marketing team want to offer promotions as an incentive for
our customers to purchase these items.

If you spend over $60, then you get 10% off your purchase
If you buy 2 or more travel card holders then the price drops to
$8.50.

Our check-out can scan items in any order, and because our
promotions will change, it needs to be flexible regarding our
promotional rules.

The interface to our checkout looks like this (shown in Ruby):
co = Checkout.new(promotional_rules)
co.scan(item)
co.scan(item)
price = co.total

Implement a checkout system that fulfils these requirements.
Test data
---------
Basket: 001,002,003
Total price expected: $66.78
Basket: 001,003,001
Total price expected: $36.95
Basket: 001,002,001,003
Total price expected: $73.76
=end

class Busines
  
  attr_accessor :bag
  

 def initialize
 
  @bag = Array.new
  @total_count=0

 end

# Discount Functionality
 def discount 

   
  travel_card_qty = @bag.count("001")
  cufflinks_qty = @bag.count("002")
  t_shirt_qty = @bag.count("003") 

  if(travel_card_qty >= 2)
    travel_card_qty =  (travel_card_qty * 8.50)
    cufflinks_qty = (cufflinks_qty * 45.00)
    t_shirt_qty = (t_shirt_qty * 19.95)
    @total_count = travel_card_qty + cufflinks_qty  + t_shirt_qty  
  else
    @total_count += (cufflinks_qty * 45.00) + (travel_card_qty * 9.25) + (t_shirt_qty * 19.95) 
  end

  if(@total_count > 60)
    dis_count = ((@total_count * 10)/100)
    @total_count = @total_count - dis_count
  end

 return @total_count
 end

 #Welcome Messages_Is_Okay 
 def Display_and_exit()
  puts "-----Welcome to business.com--------"
  puts "Choose From The Basket"
  puts "Product code | Name | Price \n
  ----------------------------------------------------------\n
  001 | Travel Card Holder | $9.25\n
  002 | Personalised cufflinks | $45.00\n
  003 | Kids T-shirt | $19.95"

  puts "Enter the Number of Offers You Want in Bag"
  Scan_Input()
end

def Scan_Input()
  arr=["001","002","003"]

  bag_size = gets.chomp.to_i
  i=0
  # bag = Array.new
  while i<=bag_size-1 do
    puts "Choose the #{i+1} product: "
    # debugger 
    input = gets.chomp.to_s
     while !arr.include?(input) && i <= bag_size-1 do
      puts "Please enter a valid Number(Choose Between [001,002,003])"
      input = gets.to_s
      i-=1

      # bag << input3
    end

    @bag.append(input)
    i=i+1
  end
# discount()
end
end


c = Business.new
c.Display_and_exit
puts "Total Price expected: $ #{c.discount}"
# p c.bag