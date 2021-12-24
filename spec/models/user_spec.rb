require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
 


  describe 'ユーザー新規登録' do
     context '新規登録できるとき' do
      it "全ての値が入っていたら登録できる。" do
      expect(@user).to be_valid
      end
     end
   
     context '新規登録できないとき' do
    it 'ニックネームが空の場合' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Nickname can't be blank")
    end
    it 'メールアドレスが空の場合' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
      
    end
    it '重複したメールアドレスは登録できない' do
      @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')


    end

    it 'メールアドレスに@を含まない場合は登録できない' do
      @user.email = "hugahuga"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    
    it '英字のみのパスワードでは登録できない' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    it '数字のみのパスワードでは登録できない' do
      @user.password = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    

    it '全角文字を含むパスワードでは登録できない' do
      @user.password = '1111iあ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    
    
    

    it 'パスワードが空の場合' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end


    it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  

    it 'お名前、苗字(漢字）が空の場合' do
      @user.name_kanji_last = '' 
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kanji last can't be blank")
      
    end

    it 'お名前、名前(漢字）が空の場合' do
      @user.name_kanji_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kanji first can't be blank")
    end

    it 'お名前、苗字(カナ) が空の場合' do
      @user.name_kana_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana last can't be blank")
    end

    it 'お名前、名前(カナ) が空の場合' do
      @user.name_kana_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana first can't be blank")
    end

    it 'お名前、名前(カナ) が全角カナじゃない場合' do
      @user.name_kana_last = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana last is invalid")
    end

    it 'お名前、苗字(カナ) が全角カナじゃない場合' do
      @user.name_kana_first = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kana first is invalid")
    end



    it '生年月日が空の場合。' do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = '1234i'
      @user.password_confirmation = '1234i'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    
    it 'お名前、苗字(全角) が全角じゃない場合' do
      @user.name_kanji_last = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kanji last is invalid")
    end

    it 'お名前、名前(全角) が全角じゃない場合' do
      @user.name_kanji_first = 'test'
      @user.valid?
      expect(@user.errors.full_messages).to include("Name kanji first is invalid")
    end

   end
  end
end
  

 


