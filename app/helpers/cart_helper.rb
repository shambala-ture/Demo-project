module CartHelper
  def get_discount_amount
    if session[:coupon]
      @percent = session[:coupon]["discount_of"].to_f / 100
      @intermediate_total = @total * @percent
      @final_total = @total - @intermediate_total
      @discount_amount = @total - @final_total 
    else
      0
    end
  end
end