class Message < ApplicationRecord
  belongs_to :user 
  has_many :months
  has_many :days
end
