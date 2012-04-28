class ApplicationController < ActionController::Base
  before_filter :authorize #evokes the authorize method after every action
  protect_from_forgery
  
  private
  
    def current_cart 
      # store the cart id session
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    
    protected 
    
    def authorize #find user id in session, if not then redirect.
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, notice: "Please Log in"
      end
    end
    
  
    
end
