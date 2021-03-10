class Staff < ApplicationRecord
  has_one_attached :image

  validates :name,      presence: true
  validates :gender,    presence: true
  validates :age,       presence: true
  validates :advantage, presence: true
  validates :position,  presence: true
  validates :appeal,    presence: true
  validates :image,     presence: true
end
