class Message < ApplicationRecord
  def self.search(search) 
    if search
      where(['messagegood LIKE ?', "%#{search}%"]) #検索とmessageの部分一致を表示。
    else
      all #全て表示させる
    end
  end

  validates :good, presence: true
  validates :bad, presence: true
  validates :improvement, presence: true
  validates :month_id, presence: true
  validates :day_id, presence: true

  
  belongs_to :user 
  belongs_to :day 
  belongs_to :month
end
