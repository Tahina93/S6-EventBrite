class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
  	@user = user
  	@url = 'http://eventbrite-tahina.herokuapp.com/'

  	mail(to: @user.email, subject: 'Bienvenue à toi, nouvelle créature !')
  end

  def new_participant_email(user)
  	@admin = 
  	@participant =

  	mail(to: @admin, subject: 'Un nouveau participant pour ton event !!')
  end
end
