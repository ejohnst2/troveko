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

  def trip_request(trip, email)
    @greeting = "Hey #{trip.first_name}"
    @trip = trip
    @email = email
    # attachments['Guide_to_Experience.pdf'] = File.read('/assets/pdfs/guide_to_experience.pdf')

    mail(to: @email, subject: "Request Made")
  end

  def trip_confirmation(trip, email)
    @email = email
    @trip = trip
    @greeting = "Hi #{trip.first_name}"
    # attachments['Guide_to_Experience.pdf'] = File.read('/app/assets/PDFs/Guide_to_Experience.pdf')

    mail(to: @email, subject: 'Your Troveko stay is confirmed')
  end

  def cancel(user,trip)
    @user = user
    @trip = trip

    mail(to: @user.email, subject: 'Your trip has been canceled')
  end
end
