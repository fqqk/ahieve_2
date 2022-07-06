class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.sendmail_user.subject
  #(
  def sendmail_user(contact)
    @contact = contact #インスタンス変数に代入
    mail to: @contact.email, subject: "お問い合わせありがとうございます"
  end
end
