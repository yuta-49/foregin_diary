class Message < ApplicationRecord
  validates :good, presence: true
  validates :bad, presence: true
  validates :improvement, presence: true
  validates :month_id, presence: true
  validates :day_id, presence: true

  
  # belongs_to :user 
  # belongs_to :day 
  # belongs_to :month
end
