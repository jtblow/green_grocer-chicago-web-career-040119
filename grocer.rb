def consolidate_cart(cart)
  count = 0 
  i = nil
  cart.each do |item, attributes|
    if item = i 
      count += 1 
      cart[item][attributes][:count] = count
    end
  end
end
    
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
