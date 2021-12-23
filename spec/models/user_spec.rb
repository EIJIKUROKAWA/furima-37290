require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe '新規登録/ユーザー情報' do
    it 'ニックネームが空の場合' do
      @user.nickname = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it 'メールアドレスが空の場合' do
      @user.email = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
      
    end
  

    it 'パスワードが空の場合' do
      @user.password = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end


    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password_confirmation = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  

    it 'お名前、苗字(漢字）が空の場合' do
      @user.name_kanji_last = ' ' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name_kanji can't be blank")
      
    end

    it 'お名前、名前(漢字）が空の場合' do
      @user.name_kanji_first = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kanji can't be blank")
    end

    it 'お名前、苗字(カナ) が空の場合' do
      @user.name_kanji_last = ' '
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name_kana can't be blank")
    end

    it '生年月日が必須であること。' do
      @user.birth = " "
      @user.valid?
      except(@user.errors.full_messages).to include("Birth can't be blank")
    end

    

  end

  

 


end