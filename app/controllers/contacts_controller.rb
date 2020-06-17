class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.valid? && @contact.save
      ContactsMailer.contact_email(@contact).deliver_now
      redirect_to root_path, notice: 'Email sent successfully'
    else
      flash[:error] = 'Could not sent message'
      render 'new'
    end
  end

  private

  def contact_params
    params.require(:contact).permit(
      :id,
      :email,
      :message
    )
  end

end
