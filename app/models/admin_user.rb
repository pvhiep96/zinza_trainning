class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  # default from: 'pvhiep96ruby@gmail.com '
  # def send_mail_admin(admin_user)
  #   @admin_user = admin_user
  #   mail to: @admin_user.email, subject: "We've received your order"
  # end
end
