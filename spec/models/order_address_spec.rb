require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '配送先情報の保存ができるとき' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@order_address).to be_valid
      end
      it 'buildingは空であっても保存できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
      it 'post_codeはハイフンを含んだ正しい形式で入力されていれば保存できる' do
        @order_address.post_code = '123-4567'
        expect(@order_address).to be_valid
      end
      it 'shipping_from_idは「---」以外を選択していれば保存できる' do
        @order_address.shipping_from_id = 2
        expect(@order_address).to be_valid
      end
      it 'cityが空でなければ保存できる' do
        @order_address.city = '札幌市'
        expect(@order_address).to be_valid
      end
      it 'block_numberが空でなければ保存できる' do
        @order_address.block_number = '1-1'
        expect(@order_address).to be_valid
      end
      it 'phone_numberが11桁以内で入力且つハイフンなしであれば保存できる' do
        @order_address.phone_number = '09012345678'
        expect(@order_address).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_address.user_id = 1
        expect(@order_address).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_address.item_id = 1
        expect(@order_address).to be_valid
      end
      it 'tokenがあれば保存できる' do
        expect(@order_address).to be_valid
      end
    end
    context '配送先情報の保存ができないとき' do
      it 'post_codeが空だと保存できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_address.post_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'shipping_from_idを選択していないと保存できない' do
        @order_address.shipping_from_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping from can't be blank")
      end
      it 'cityが空だと保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'block_numberが空だと保存できない' do
        @order_address.block_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block number can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは12桁以上だと保存できない' do
        @order_address.phone_number = '090123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is valid")
      end
      it 'phone_numberにハイフンがあると保存できない' do
        @order_address.phone_number = '090-1234-5678'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is valid")
      end
      it 'user_idが空だと保存できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it '都道府県に「---」が選択されている場合は購入できない' do
        @order_address.shipping_from_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping from can't be blank")
      end
      it '電話番号が9桁以下では購入できない' do
        @order_address.phone_number = '090123456'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is valid")
      end
    end
  end
end
