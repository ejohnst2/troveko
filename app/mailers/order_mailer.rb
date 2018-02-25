class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  def request(user)
    @user = user
    @greeting = "Hi #{user.first_name}"

    mail(to: @user.email, subject: 'Your trip request has been made')
  end

end
