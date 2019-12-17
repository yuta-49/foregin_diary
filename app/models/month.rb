class Month < ApplicationRecord
  has_many :message
  belongs_to :user
end
