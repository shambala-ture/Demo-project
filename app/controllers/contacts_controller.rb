class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = 'Thank you for your message. We will contact you soon!'
    else
      flash[:error] = 'Cannot send message.'
      render :new
    end
    UserMailer.email_contact(@contact).deliver
    redirect_to new_contact_path
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :contact_us, :message)
  end
end