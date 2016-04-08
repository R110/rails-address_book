class ContactsController < ApplicationController
  def index
    the_contacts = Contact.all
    alphabetical_contacts = the_contacts.sort_by{|contact| contact.name}
    @contacts = alphabetical_contacts
  end
  def new
    render "new"
  end
  def create
    #render(:text => params[:contact].inspect)
    phone_valid = params[:contact][:phone_number].match(/^\d{3}\-\d{3}\-\d{4}$/)
    email_valid = params[:contact][:email].match(/ ^\w+\@\w+\.\w{2,3}$ /)


    if !phone_valid
      @error= "Invalid phone number"
    elsif !email_valid
      @error= "Invalid email"
    elsif phone_valid && email_valid
      contact = Contact.new(
        :name => params[:contact][:name],
        :address => params[:contact][:address],
        :phone_number => params[:contact][:phone_number],
        :email_address => params[:contact][:email_address])
      contact.save

    redirect_to("/")
    else
      redirect_to("/error")
    end
  end
  def contact_details
    contact_id = params[:id]
    @contact = Contact.find_by(name: contact_id)
  end
  def error
    render "error"
  end
end
