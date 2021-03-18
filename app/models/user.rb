class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  validates :name, presence: true
  validates :gender_id, numericality: { other_than: 1 }
  with_options presence: true, format: { with: /\A[0-9]\d+\z/, message: 'は半角数字で入力してください' } do
    validates :age, presence: true
    validates :phone, presence: true
  end

  has_many :appoints, dependent: :destroy
  has_many :staffs, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :sns_credentials, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create

    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
