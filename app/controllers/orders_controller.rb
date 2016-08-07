class OrdersController < ApplicationController
  before_filter :authenticate_user!, except: [:status,:search]
  before_filter :set_cart_quantity_price
  def index
    @orders = current_user.orders
  end

  def search
      if params[:search_id].present? || params[:search_created_at].present?
          @orders = Order.where("orders.id = ? or DATE(created_at) = ?", params[:search_id], params[:search_created_at])
        else
          @orders = current_user.orders.order('created_at DESC')
      end
    render 'index'
  end

  def status
    if params[:search_id].present?
      @order = Order.find_by(id: params[:search_id])
    end
  end

  def report
    
  end

  def show
    @order = Order.find(params[:id])
    #@user_order = UserOrder.where(order_id: params[:id]).first
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "My_order",  :template => 'orders/show.pdf.erb',# Excluding ".pdf" extension.
               disposition: 'attachment'
               # header: {
               #  html: {   
               #    template:'orders/header.html'
               #  }
               # },
               # footer: {
               #  html: {   
               #    template:'orders/footer.html'
               #  }
               # }
      end
    end
    UserMailer.email_order(@order).deliver if request.format == "pdf"
  end

  def new
    @order = Order.new
  end

  def create
    if session[:order_id].present?

      @order = Order.find(session[:order_id])
      @cart_products.each do |k,v|
        @order_detail = OrderDetail.find_or_initialize_by(product:k,order:@order)
          @order_detail.quantity = v[:quantity]
          @order_detail.amount = v[:total_price]
          @order_detail.save
      end
      #@user_order = UserOrder.find_by(order:@order,user:current_user)
      # if @user_order
      #   @billing_address = Address.find(params[:billingaddress])
      #   @shipping_address = Address.find(params[:shippingaddress])
      #   @coupon_code = session[:coupon].present? ? session[:coupon]["id"] : nil  
      #   @user_order.billing_address = @billing_address
      #   @user_order.shipping_address = @shipping_address
      #   @user_order.total_amount = @total
      #   @user_order.coupon_id = @coupon_code
      #   @user_order.save
      # end

      if @order
        @billing_address = Address.find(params[:billingaddress])
        @shipping_address = Address.find(params[:shippingaddress])
        @coupon_code = session[:coupon].present? ? session[:coupon]["id"] : nil  
        @order.billing_address = @billing_address
        @order.shipping_address = @shipping_address
        @order.total_amount = @total
        @order.coupon_id = @coupon_code
        @order.save
      end


      if @coupon_code
        @used_coupon = UsedCoupon.find_by(order_id:@order.id)
        @used_coupon.coupon_id = @coupon_code
        @used_coupon.save
      end

    else
      @order = Order.create(user:current_user)
      @cart_products.each do |k,v|
      @order_detail = OrderDetail.create(quantity:v[:quantity], amount:v[:total_price], product:k, order: @order)
      end

      @billing_address = Address.find(params[:billingaddress])
      @shipping_address = Address.find(params[:shippingaddress])
      @coupon_code = session[:coupon].present? ? session[:coupon]["id"] : nil
      @coupon =Coupon.find_by_id(@coupon_code)
      @order.billing_address=@billing_address
      @order.shipping_address=@shipping_address
      if @coupon   
        @order.coupon = @coupon
        @final_total=@order.total_price(@coupon,@total)
      else
        @final_total=@total
      end
      @order.total_amount= @final_total
      @order.save
      # @order = Order.create(user_id: current_user.id, billing_address:@billing_address, shipping_address:@shipping_address, total_amount:@final_total, coupon_id:@coupon_code)
      

      session[:order_id] = @order.id      

      if @coupon_code
        @used_coupon = UsedCoupon.create(user:current_user,coupon_id:@coupon_code,order_id:@order.id)
      end
    end  

    redirect_to order_path(@order)
  end

end