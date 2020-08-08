
require 'pry'
class CashRegister   
  attr_accessor :total, :discount, :price, :items    
      #total is supposed to return the current total

  def initialize(discount = 0)
    @total = 0    # 'sets an instance variable @total on initialization to default to zero
    @discount = discount   # optionally takes an employee discount on initialization'
    @items = []    #we set @items to an empty array because we use it to return an array containing all items that have been added
  end

  def add_item(item, price, quantity = 1)  #add item accepts a title and a price and increases the total by a default value of 1
         @total += price * quantity      # add item also accepts an optional quantity
    if quantity > 1
      counter = 0     
      while counter < quantity      #doesnt forget about the previous total
        @items << item              #adds the numbers of the item equal to it's quantity to the array of listed items
        counter += 1
      end
    else
      @items << item
    end
  end

  def apply_discount   # the cash register was initialized with an employee discount^^^
    if @discount > 0
      @to_take_off = (price * discount)/100     # applies the discount to the total price
      @total -= @to_take_off    # 'reduces the total
      return "After the discount, the total comes to $#{total}."  #  returns success message with updated total
    else
      return "There is no discount to apply."    #if fthe cash register was not initialized with an employee discount it returns a string error message that there is no discount to apply'
    end
  end

  def void_last_transaction  #this method subtracts the last transaction from the total
    @total -= @price
  end

end