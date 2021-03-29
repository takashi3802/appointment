require 'rails_helper'
RSpec.describe Staff, type: :model do
  describe 'スタッフ登録' do

    before do
      @staff = FactoryBot.build(:staff)
    end

    context 'スタッフ登録できるとき' do
      it 'Eメール,パスワード,パスワード（確認）,名前,性別,年齢,電話番号が存在すれば登録できる' do
        expect(@staff).to be_valid
      end

    end

  end
end