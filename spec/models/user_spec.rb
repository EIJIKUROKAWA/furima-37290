require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe '新規登録/ユーザー情報' do
    it 'ニックネームが必須であること' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
      
    end
  
    it 'メールアドレスが一意性であること' do
      @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include ('Email has already been taken')
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email ='@'
      @user.valid?
      exept(@user.erros.full_messages). to include ("Email @ Must be include")
    end

    it 'パスワードが必須であること' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end

    it 'パスワードは、6文字以上の入力が必須であること' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      expect(@user).to be_valid
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      expect(@user).to be_valid
      
    end

    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
  end  




  describe '新規登録/本人情報確認' do
    it 'お名前(全角)は、名字と名前がそれぞれ必須であること。' do
      @user.name_kanji_last = '山田' 
      @user.name_kanji_first = '太朗'
      expect(@user).to be_valid


    end

    it 'お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
      @user.name_kanji_last = '山田'
      expect(@user).to be_valid
    end

    it 'お名前カナ(全角)は、名字と名前がそれぞれ必須であること。' do
      @user.name_last = 'ヤマダ'
      @user.name_first = 'タロウ'
      expect(@user).to be_valid
    end

    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
      @user.name_kana_first = 'ヤマダ'
      expect(@user).to be_valid
    end

    it 'お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
      @user.name_kana_last = 'タロウ'
      expect(@user).to be_valid

    
    end

    it '生年月日が必須であること。' do
      @user.birth = " "
      @user.valid?
      except(@user.errors.full_messages).to include("Birth can't be blank")


    end

  end

  

 


end