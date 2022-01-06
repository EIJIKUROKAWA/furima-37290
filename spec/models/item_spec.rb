require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '全ての項目が入力されていたら出品できる。' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '画像ファイルがないとき' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end

      it '商品名が空の時' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it '商品の説明 が空のとき' do
        @item.item_text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明文を入力してください")
      end
      it 'カテゴリー が空のとき' do
        @item.item_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品のカテゴリーを選択してください")
      end

      it '商品の状態 が空のとき' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end

      it '配送料の負担 が空のとき' do
        @item.postage_included_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送料の負担を選択してください")
      end
      it '発送元の地域 が空のとき' do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end

      it '発送までの日数 が空のとき' do
        @item.send_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      it '価格が299以下のとき' do
        @item.price =  1
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は一覧にありません')
      end
      it '価格が空のとき' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください", "価格は一覧にありません", "価格は不正な値です")
      end
      it '価格が10000000円以上だと出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は一覧にありません")
      end
      it '価格が全角文字では登録できないこと' do
        @item.price = 'あああ'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は一覧にありません")
      end
      it '価格が半角英語では登録できないこと' do
        @item.price = 'aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は一覧にありません")
      end
      it '価格が半角英数混合では登録できないこと' do
        @item.price = 'aa11'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は一覧にありません")
      end
      it 'カテゴリー のidが空のとき' do
        @item.item_category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品のカテゴリーを入力してください", "商品のカテゴリーを選択してください")
      end
      it '商品の状態 のidが空のとき' do
        @item.item_condition_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください", "商品の状態を選択してください")
      end
      it '配送料の負担 のidが空のとき' do
        @item.postage_included_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送料の負担を入力してください", "発送料の負担を選択してください")
      end
      it '発送元の地域 のidが空のとき' do
        @item.send_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください", "発送までの日数を選択してください")
      end
      it '発送までの日数 のidが空のとき' do
        @item.send_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください", "発送までの日数を選択してください")
      end
    end
  end
end
