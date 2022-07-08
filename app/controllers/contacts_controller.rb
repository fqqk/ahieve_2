class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render new
    end
  end

  def back
  end

  def create
  end

  private
  
  def contact_params
    params.require(:contact).permit(:name,:email,:category,:content)
  end
end
