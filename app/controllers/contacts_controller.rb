class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def confirm
    set_contact
    render :new if @contact.invalid?
  end

  def back
    set_contact
    render :new
  end

  def create
    set_contact
    if @contact.save
      ContactMailer.sendmail_user(@contact).deliver
      redirect_to blogs_url, notice: 'お問い合わせありがとうございます！'
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :category, :content)
  end

  def set_contact
    @contact = Contact.new(contact_params)
  end
end
