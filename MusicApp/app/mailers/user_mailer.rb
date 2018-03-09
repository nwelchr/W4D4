class UserMailer < ApplicationMailer

  default from: 'musicapp@musicapp.com'

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: 'Incredible!')
  end

end
