class UserMailer < ApplicationMailer
   default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
  def email_invoice(invoice)
    @invoice = invoice
    attachments["invoice.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(:pdf => "invoice",:template => 'orders/show.pdf.erb')
    )
    self.instance_variable_set(:@lookup_context, nil)
    mail :subject => "Your Invoice", :to => invoice.customer.email
  end
end
