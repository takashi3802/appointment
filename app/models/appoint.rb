class Appoint < ApplicationRecord
  validates :user,       presence: true
  validates :staff,      presence: true
end
