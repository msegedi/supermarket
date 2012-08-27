require './discount_type.rb'

module Supermarket
  def Supermarket.calculate_total_price(quantity, unit_price, discount_type = nil)
    # Verify quantity is an integer.
    unless quantity.is_a? Integer
      raise "quantity must be an integer"
    end
    
    # Verify quantity is greater than zero.
    unless quantity > 0
      raise "quantity must be greater than zero"
    end
    
    # Verify unit_price is numeric.
    unless quantity.is_a? Numeric
      raise "unit_price must be numeric"
    end
    
    # Verify unit_price is not negative.
    if unit_price < 0
      raise "unit_price must not be negative"
    end
    
    # Verify discount_type exists or is nil.
    if (!discount_type.nil? && !discount_type.is_a?(Integer)) || discount_type < 1 || discount_type > 3
      raise "discount_type does not exist"
    end
    
    case discount_type
    when DiscountType::THREE_FOR_A_DOLLAR
      # Three must be purchased for the discount to kick in. Every unit above the third but below the sixth will cost the unit_price.
      groups_of_three = quantity / 3
      remainder = quantity % 3
      total = (groups_of_three * 1.00) + (remainder * unit_price)
      
      return total
    when DiscountType::DOLLAR_NINETY_NINE_PER_POUND
      raise "not implemented"
    else
      raise "not implemented"
    end
  end
end
