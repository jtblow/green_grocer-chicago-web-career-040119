def consolidate_cart(cart)
  consolidated_cart = {}

  cart.each do |item|
    item_name = item.keys[0]

    consolidated_cart[item_name] = item.values[0]

    if consolidated_cart[item_name][:count] 
      consolidated_cart[item_name][:count] += 1
    else
      consolidated_cart[item_name][:count] = 1
    end
  end

  consolidated_cart
end

  def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    name = coupon[:item]
    if cart[name] && cart[name][:count] >= coupon[:num]
      if cart["#{name} W/COUPON"]
        cart["#{name} W/COUPON"][:count] += 1
      else
        cart["#{name} W/COUPON"] = {:count => 1, :price => coupon[:cost]}
        cart["#{name} W/COUPON"][:clearance] = cart[name][:clearance]
      end
      cart[name][:count] -= coupon[:num]
    end
  end
  cart
end

def apply_clearance(cart)
  cart.each do |item, attributes|
    if attributes[:clearance] == true 
      new_price = attributes[:price] * 0.80
      attributes[:price] = new_price.round(2)
    end
  end
  cart
end
def checkout(cart, coupons)
  consolidated_cart = consolidate_cart(cart)
  couponed_cart = apply_coupons(consolidated_cart, coupons)
  last_cart = apply_clearance(couponed_cart)
  total = 0 
  last_cart.each do |item, attributes|
    total += attributes[:price] * attributes[:count]
  end
    total = total * 0.9 if total > 100 
    total
  end
