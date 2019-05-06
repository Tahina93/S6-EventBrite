class User < ApplicationRecord
  after_create :welcome_send

  has_many :owned_events, foreign_key: 'admin_id', class_name: "Event"
  has_many :attendances
  has_many :created_events, foreign_key: 'participant_id', class_name: "Event", through: :attendances

  def welcome_send
  	UserMailer.welcome_email(self).deliver_now
  end
  
end
