class Order < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  #destory all line items whenever the order is destroyed
  
  PAYMENT_TYPES = [ "Debit Card", "Credit Card" ]
  
  city_email = /\A[\w+\-.]+@city.ac.uk/i
  
  validates :name, :address, :email, presence: true
  validates :email, format: {with: city_email, message: 'Must be a City University Email'}
  validates :pay_type, inclusion: PAYMENT_TYPES
  
  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      #for each item from the cart
      item.cart_id = nil
      #set an id to the cart
      line_items << item
      #add the item from line_items
    end
  end
  
end
