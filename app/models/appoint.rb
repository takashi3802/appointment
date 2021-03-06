class Appoint < ApplicationRecord
  validates :start_time, presence: true
  validates :time_select_id, numericality: { other_than: 1 }
  belongs_to :user
  belongs_to :staff
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :time_select
end
