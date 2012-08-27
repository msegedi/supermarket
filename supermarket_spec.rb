require './supermarket.rb'
require './discount_type.rb'

describe Supermarket, "#calculate_total_price" do
  # ToDo: Check more specifically for exception messages.
  context "invalid input" do
    it "throws an exception if quantity is not an integer" do
      lambda { Supermarket.calculate_total_price("test", 0) }.should raise_error
    end
    
    it "throws an exception if quanity is not greater than 0" do
      lambda { Supermarket.calculate_total_price(0, 0) }.should raise_error
    end
    
    it "throws an exception if unit_price is not numeric" do
      lambda { Supermarket.calculate_total_price(1, "test") }.should raise_error
    end
    
    it "throws an exception if unit_price is negative" do
      lambda { Supermarket.calculate_total_price(1, -1.33) }.should raise_error
    end
    
    it "throws an exception if the given discount type is invalid or does not exist" do
      lambda { Supermarket.calculate_total_price(1, 1.33, "test") }.should raise_error
      lambda { Supermarket.calculate_total_price(1, 1.33, 0) }.should raise_error
    end
  end
  
  context "three for a dollar" do
    it "returns $0.66 for quantity of 2 when unit cost is $0.33" do
      Supermarket.calculate_total_price(2, 0.33, DiscountType::THREE_FOR_A_DOLLAR).should eq(0.66)
    end
    
    it "returns $1.00 for quantity of 3 when unit cost is $0.33" do
      Supermarket.calculate_total_price(3, 0.33, DiscountType::THREE_FOR_A_DOLLAR).should eq(1.00)
    end
    
    it "returns $1.33 for quantity of 4 when unit cost is $0.33" do
      Supermarket.calculate_total_price(4, 0.33, DiscountType::THREE_FOR_A_DOLLAR).should eq(1.33)
    end
    
    it "returns $3.66 for quantity of 11 when unit cost is $0.33" do
      Supermarket.calculate_total_price(11, 0.33, DiscountType::THREE_FOR_A_DOLLAR).should eq(3.66)
    end
  end
end
