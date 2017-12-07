class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  def welcome(user)
    @user = user
    @greeting = "Hi"

    mail(to: @user.email, subject: 'Welcome to Troveko')
  end

  def cancel(user,trip)
    @user = user
    @trip = trip

    mail(to: @user.email, subject: 'Trip Cancelled!!')
  end
end
