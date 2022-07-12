# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/sendmail_user
  def sendmail_user
    ContactMailer.sendmail_user
  end
end
