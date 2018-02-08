class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  def welcome(user)
    @user = user
    @greeting = "Hi #{user.first_name}"

    mail(to: @user.email, subject: 'Welcome to Troveko')
  end

  # def request(user, trip)
  #   @user = user
  #   @greeting = "Hi #{user.first_name}"

  #   mail(to: @user.email, subject: 'Your trip request has been made')
  # end

  def confirmation(user, trip)
    @user = user
    @greeting = "Hi #{user.first_name}"

    mail(to: @user.email, subject: 'Your Troveko stay is confirmed')
  end

  def cancel(user,trip)
    @user = user
    @trip = trip

    mail(to: @user.email, subject: 'Your trip has been canceled')
  end
end
