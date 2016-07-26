class UserMailer < ApplicationMailer
   default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  def email_order(order)
    @order = order
    attachments["order.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(:pdf => "My_order",:template => 'orders/show.pdf.erb')
    )
    mail :subject => "Your Order details PDF is attached", :to => order.user.email
  end
end
