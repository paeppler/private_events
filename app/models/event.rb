class Event < ApplicationRecord
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'
  has_many :attendees, dependent: :destroy, class_name: 'Attendance'

  scope :upcoming, -> { where("date > ?", Time.now).order("date asc") }
  scope :past, -> { where("date < ?", Time.now).order("date asc") }

  
end
