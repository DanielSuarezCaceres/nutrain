class ContactsMailer < ApplicationMailer
  # default from: 'nutrainapp@gmail.com'
  #layout 'mailer'

  def contact_email(contact)
    @contact = contact
    mail(to: "nutrainapp@gmail.com", from: @contact.email, subject: "You have a new message from Nutrain app")
  end

end
