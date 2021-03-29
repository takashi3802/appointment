require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    before do
      @user = FactoryBot.build(:user)
    end

    context '新規登録できるとき' do
      it 'Eメール,パスワード,パスワード（確認）,名前,性別,年齢,電話番号が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'パスワードが6文字以上であれば登録できること' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        expect(@user).to be_valid
      end

      it 'パスワードが半角英数混合であれば登録できること' do
        @user.password = '111aaa'
        @user.password_confirmation = '111aaa'
        expect(@user).to be_valid
      end

      it '職業が空でも保存できること' do
        @user.occupation = ''
        expect(@user).to be_valid
      end

      it '悩みが空でも保存できること' do
        @user.trouble = ''
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '名前が空では登録できないこと' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end

      it 'Eメールが空では登録できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end

      it 'パスワードが空では登録できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end

      it '年齢が空では登録できないこと' do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('年齢を入力してください')
      end

      it '性別が--では登録できないこと' do
        @user.gender_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('性別を選択してください')
      end

      it '電話番号が空では登録できないこと' do
        @user.phone = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('電話番号を入力してください')
      end
    end

  end
end