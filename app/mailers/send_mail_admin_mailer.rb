class SendMailAdminMailer < ApplicationMailer
  default from: 'pvhiep96ruby@gmail.com '
  def send_mail_admin
    @orders = Order.checkout.where('DATE(created_at) = ?', Date.today)
    mail to: AdminUser.first.email, subject: "We've received your order"
  end
end
