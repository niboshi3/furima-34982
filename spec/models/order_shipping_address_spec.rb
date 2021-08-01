require 'rails_helper'

RSpec.describe OrderShippingAddress, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping_address = FactoryBot.build(:order_shipping_address, user_id: user.id, item_id: item.id) 
      sleep 0.1
    end


    context '商品購入できるとき' do
      it 'postal_code,prefecture_id,municipality,address,telephone_number,tokenが存在すれば購入できる' do
        expect(@order_shipping_address).to be_valid
      end
      it 'ビル名がなくても購入できる' do
        @order_shipping_address.building = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address).to be_valid
      end
      it '電話番号が11桁以内なら購入できる' do
        @order_shipping_address.telephone_number = '09012345678'
        @order_shipping_address.valid?
        expect(@order_shipping_address).to be_valid
      end
    end

    context '商品購入できないとき' do
      it '郵便番号がないと購入できない' do
        @order_shipping_address.postal_code = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンがないと購入できない' do
        @order_shipping_address.postal_code = '1234567'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県がないと購入できない' do
        @order_shipping_address.prefecture_id = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '都道府県が未選択の場合は購入できない' do
        @order_shipping_address.prefecture_id = 1
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区村町がないと購入できない' do
        @order_shipping_address.municipality = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Municipality can't be blank")
      end
      it '住所がないと登録できない' do
        @order_shipping_address.address = ''
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと登録できない' do
        @order_shipping_address.telephone_number = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号が11桁以上では購入できない' do
        @order_shipping_address.telephone_number = '000123456789'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号が数字ではないと購入できない' do
        @order_shipping_address.telephone_number = 'abcdefg'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号にハイフンがあると購入できない' do
        @order_shipping_address.telephone_number = '090-123-456'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号が全角数字だと購入できない' do
        @order_shipping_address.telephone_number = '０９０-１２３-５６７'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号が9桁以下だと購入できない' do
        @order_shipping_address.telephone_number = '090-123-45'
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it "tokenが空では購入できないこと" do
        @order_shipping_address.token = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空では購入できないこと" do
        @order_shipping_address.user_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空では購入できないこと" do
        @order_shipping_address.item_id = nil
        @order_shipping_address.valid?
        expect(@order_shipping_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
