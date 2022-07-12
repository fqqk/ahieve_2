class ContactMailer < ApplicationMailer
  def sendmail_user(contact)
    @contact = contact
    mail to: @contact.email, subject: 'お問い合わせありがとうございます'
  end
end
