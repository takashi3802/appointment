class Staff < ApplicationRecord
  has_one_attached :image

  validates :name,      presence: true
  validates :advantage, presence: true
  validates :position,  presence: true
  validates :appeal,    presence: true
  validates :image,     presence: true
  validates :gender_id, numericality: { other_than: 1 }
  validates :age, presence: true, format: { with: /\A[0-9]\d+\z/, message: 'は半角数字で入力してください' }

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
end
