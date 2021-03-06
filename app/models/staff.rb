class Staff < ApplicationRecord
  has_one_attached :image

  validates :name,      presence: true
  validates :advantage, presence: true
  validates :position,  presence: true
  validates :appeal,    presence: true
  validates :image,     presence: true
  validates :gender_id, numericality: { other_than: 1 , message: 'を選択してください'}
  validates :age, presence: true, format: { with: /\A[0-9]\d+\z/, message: 'は半角数字で入力してください' }

  
  has_many :appoint, dependent: :destroy
  has_many :messages, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
end
