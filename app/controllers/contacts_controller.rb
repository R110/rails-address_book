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

    if !phone_valid
      redirect_to "/error"
    else phone_valid
      contact = Contact.new(
        :name => params[:contact][:name],
        :address => params[:contact][:address],
        :phone_number => params[:contact][:phone_number],
        :email_address => params[:contact][:email_address],
        :favorite_status => params[:contact][:favorite_status])
      contact.save

    redirect_to("/")
    end
  end
  def contact_details
    contact_id = params[:id]
    @contact = Contact.find_by(name: contact_id)
  end
  def error
    render "error"
  end
  def favorite
    contact_name = params[:id]
    contact = Contact.find_by(name: contact_name)
    contact[:favorite_status] = "true"
    contact.save
    redirect_to("/")
  end
  def search_contacts
    letter = params[:search_term]
    the_contacts = Contact.all
    letter_contacts = the_contacts.select{|contact| contact.name[0] == letter.upcase}
    @contacts = letter_contacts
  end
end
