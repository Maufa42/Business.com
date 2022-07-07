class Pricing
  def initialize
    @total_count = 0
  end

  def pricing_rule(bag)
     
  travel_card_qty = bag.count("001")
  cufflinks_qty = bag.count("002")
  t_shirt_qty = bag.count("003") 

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

end