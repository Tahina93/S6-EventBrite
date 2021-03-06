class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send

  has_many :owned_events, foreign_key: 'admin_id', class_name: "Event"
  has_many :attendances, foreign_key: 'participant_id'
  has_many :created_events, foreign_key: 'created_events_id', class_name: "Event", through: :attendances

  def welcome_send
  	UserMailer.welcome_email(self).deliver_now
  end

end
