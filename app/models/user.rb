class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :gender_id, numericality: { other_than: 1 }, presence: true
  with_options presence: true, format: { with: /\A[0-9]\d+\z/, message: 'は半角数字で入力してください' } do
    validates :age, presence: true
    validates :phone, presence: true
  end

  has_many :appoints
  has_many :staffs

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender
end
