# Preview all emails at http://localhost:3000/rails/mailers/send_mail_admin
class SendMailAdminPreview < ActionMailer::Preview
  default from: 'pvhiep96ruby@gmail.com '
  def send_mail_admin(admin_user)
    @admin = admin_user
    mail to: @admin.email, subject: "We've received your order"
  end
end
