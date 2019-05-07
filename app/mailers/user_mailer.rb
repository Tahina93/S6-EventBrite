class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
  	@user = user
  	@url = 'http://eventbrite-tahina.herokuapp.com/'

  	mail(to: @user.email, subject: 'Bienvenue à toi, nouvelle créature !')
  end

	def new_participant_email(attendance)
		@event = attendance.created_event
  	@admin = @event.admin
  	@participant = attendance.participant

  	mail(to: @admin.email, subject: 'Un nouveau participant pour ton event !!')
  end
end
