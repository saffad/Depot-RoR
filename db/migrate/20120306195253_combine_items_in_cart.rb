class CombineItemsInCart < ActiveRecord::Migration
  def up
    # replace multiple items of a single product in cart with single item
    Cart.all.each do |cart|
      #count number of products in cart
      sums = cart.line_items.group(:product_id).sum(:quantity)
      
      sums.each do |product_id, quantity|
        if quantity > 1
          #remove ind items
          cart.line_items.where(product_id: product_id).delete_all
          
          #replace with single item
          cart.line_items.create(product_id: product_id, quantity: quantity)
        end
      end
    end
        
  end

  def down
    #split multiple items with quantity greater than 1 with into mulitple line items
    LineItem.where("quantity>1").each do |line_item|
      #add indiv items
      line_item.quantity.times do
        LineItem.create cart_id: line_item.cart_id,
          product_id: line_item.product_id, quantity: 1
        end
        
        #remove org item
        line_item.destroy
      end
    
  end
end
