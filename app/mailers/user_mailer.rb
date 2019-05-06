class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
  	@user = user
  	@url = 'http://eventbrite-tahina.herokuapp.com/'

  	mail(to: @user.email, subject: 'Bienvenue à toi, nouvelle créature !')
  end
end
