class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '女性' },
    { id: 3, name: '男性' },
    { id: 4, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :users
  has_many :staffs
end
