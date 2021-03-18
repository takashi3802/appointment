class Message < ApplicationRecord
  belongs_to :user
  belongs_to  :staff
  validates :text, presence: true
end
