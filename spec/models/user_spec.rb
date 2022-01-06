require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての値が入っていたら登録できる。' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'ニックネームが空の場合' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'メールアドレスが空の場合' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'メールアドレスに@を含まない場合は登録できない' do
        @user.email = 'hugahuga'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = '1111iあ'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません", "パスワードは不正な値です")
      end

      it 'パスワードが空の場合' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワードは不正な値です", "パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end

      it 'お名前、苗字(漢字）が空の場合' do
        @user.name_kanji_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前 苗字（全角)を入力してください", "お名前 苗字（全角)は不正な値です")
      end

      it 'お名前、名前(漢字）が空の場合' do
        @user.name_kanji_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前 名前 (全角）を入力してください", "お名前 名前 (全角）は不正な値です")
      end

      it 'お名前、苗字(カナ) が空の場合' do
        @user.name_kana_last = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前 カナ 苗字(全角)を入力してください", "お名前 カナ 苗字(全角)は不正な値です")
      end

      it 'お名前、名前(カナ) が空の場合' do
        @user.name_kana_first = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前 カナ 名前(全角)を入力してください", "お名前 カナ 名前(全角)は不正な値です")
      end

      it 'お名前、名前(カナ) が全角カナじゃない場合' do
        @user.name_kana_last = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前 カナ 苗字(全角)は不正な値です')
      end

      it 'お名前、苗字(カナ) が全角カナじゃない場合' do
        @user.name_kana_first = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前 カナ 名前(全角)は不正な値です')
      end

      it '生年月日が空の場合。' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end

      it 'passwordが5文字以下であれば登録できない' do
        @user.password = '1234i'
        @user.password_confirmation = '1234i'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end

      it 'お名前、苗字(全角) が全角じゃない場合' do
        @user.name_kanji_last = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前 苗字（全角)は不正な値です')
      end

      it 'お名前、名前(全角) が全角じゃない場合' do
        @user.name_kanji_first = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('お名前 名前 (全角）は不正な値です')
      end
    end
  end
end
