class OrdersController < ApplicationController
  def index
    
  end
  
  def payment
    @address = Address.find(params[:id])
    @address.user=current_user

    redirect_to payment_path
  end

end
