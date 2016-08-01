class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, confirmation: true
  after_update :contact_update

  def contact_update
    if self.note?
      @contact=Contact.create(:note => self.note,:email=>self.email)
      UserMailer.admin_email_contact(@contact).deliver
    end
  end

end
