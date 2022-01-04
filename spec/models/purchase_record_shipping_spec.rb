require 'rails_helper'

RSpec.describe PurchaseRecordShipping, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_record_shipping = FactoryBot.build(:purchase_record_shipping, user_id: user.id, item_id: item.id)
      sleep 0.4
    end
    describe '配送先情報の保存' do
      context '商品保存がうまくいくとき' do
        it 'shipping_number,area_id,shipping_city,shipping_adress,telephone_number,token が存在すれば購入できる' do
          expect(@purchase_record_shipping).to be_valid
        end
        it 'user_idが空でなければ保存できる' do
          @purchase_record_shipping.user_id = 1
          expect(@purchase_record_shipping).to be_valid
        end
        it 'item_idが空でなければ保存できる' do
          @purchase_record_shipping.item_id = 1
          expect(@purchase_record_shipping).to be_valid
        end
        it '郵便番号が「3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
          @purchase_record_shipping.shipping_number = '123-4560'
          expect(@purchase_record_shipping).to be_valid
        end
        it '都道府県が「---」以外かつ空でなければ保存できる' do
          @purchase_record_shipping.area_id = 1
          expect(@purchase_record_shipping).to be_valid
        end
        it '市区町村が空でなければ保存できる' do
          @purchase_record_shipping.shipping_city = ' 札幌市 '
          expect(@purchase_record_shipping).to be_valid
        end
        it '番地が空でなければ保存できる' do
          @purchase_record_shipping.shipping_address = ' ５５５ '
          expect(@purchase_record_shipping).to be_valid
        end
        it '建物名が空でも保存できる' do
          @purchase_record_shipping.shipping_building = nil
          expect(@purchase_record_shipping).to be_valid
        end
        it '電話番号が11番桁以内かつハイフンなしであれば保存できる' do
          @purchase_record_shipping.telephone_number = 11_111_111_111
          expect(@purchase_record_shipping).to be_valid
        end
      end

      context '配送先情報の保存ができないとき' do
        it 'user_idが空だと保存できない' do
          @purchase_record_shipping.user_id = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空だと保存できない' do
          @purchase_record_shipping.item_id = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include("Item can't be blank")
        end
        it '郵便番号が空だと保存できないこと' do
          @purchase_record_shipping.shipping_number = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include("Shipping number can't be blank",
                                                                            'Shipping number is invalid. Include hyphen(-)')
        end
        it '郵便番号にハイフンがないと保存できないこと' do
          @purchase_record_shipping.shipping_number = '1_111_111'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include('Shipping number is invalid. Include hyphen(-)')
        end
        it '都道府県が「---」だと保存できないこと' do
          @purchase_record_shipping.area_id = 0
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include("Area can't be blank")
        end
        it '都道府県が空だと保存できないこと' do
          @purchase_record_shipping.area_id = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include("Area can't be blank")
        end
        it '市区町村が空だと保存できないこと' do
          @purchase_record_shipping.shipping_city = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include("Shipping city can't be blank")
        end
        it '番地が空だと保存できないこと' do
          @purchase_record_shipping.shipping_address = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include("Shipping address can't be blank")
        end
        it '電話番号が空だと保存できないこと' do
          @purchase_record_shipping.telephone_number = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include("Telephone number can't be blank")
        end
        it '電話番号にハイフンがあると保存できないこと' do
          @purchase_record_shipping.telephone_number = '078 - 1111 - 1111'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include('Telephone number is invalid')
        end
        it '電話番号が12桁以上あると保存できないこと' do
          @purchase_record_shipping.telephone_number = '111_111_111_111'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include('Telephone number is invalid')
        end
        it 'トークンが空だと保存できないこと' do
          @purchase_record_shipping.token = nil
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include("Token can't be blank")
        end
        it '9桁以下の電話番号は登録できないこと' do
          @purchase_record_shipping.telephone_number = '111_111_111'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include('Telephone number is invalid')
        end
        it '電話番号に半角数字以外が含まれている場合は購入できないこと' do
          @purchase_record_shipping.telephone_number = '11111111111あ'
          @purchase_record_shipping.valid?
          expect(@purchase_record_shipping.errors.full_messages).to include('Telephone number is invalid')
        end
      end
    end
  end
end
