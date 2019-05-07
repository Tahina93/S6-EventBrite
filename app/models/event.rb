class Event < ApplicationRecord
  validate :multiple_of_five
  validate :in_the_future
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :title, presence: true, length: {minimum: 5, maximum: 140}
  validates :description, presence: true, length: {minimum: 5, maximum: 1000}
  validates :price, presence: true, numericality: {greater_than: 0, smaller_than: 1000}
  validates :location, presence: true


  belongs_to :admin, foreign_key: "admin_id", class_name: "User"

  has_many :attendances, foreign_key: 'created_event_id'
  has_many :participants, foreign_key: 'participant_id', class_name: "User", through: :attendances


private

  def in_the_future
    errors.add(:start_date, "must be in the future.") if !start_date.blank? and start_date < DateTime.now
  end

  def multiple_of_five
    errors.add(:duration, "must be mulitple of 5.") if !duration.blank? and duration % 5 != 0
  end
end
