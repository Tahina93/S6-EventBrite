class Attendance < ApplicationRecord
  after_create :new_participant_send

  belongs_to :participant, class_name: "User"
  belongs_to :created_event, class_name: "Event"

  def new_participant_send
    UserMailer.new_participant_email(self).deilver_now
  end
end
