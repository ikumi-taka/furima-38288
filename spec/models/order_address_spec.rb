require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    context '配送先情報の保存ができるとき' do
      it 'すべての情報が正しく入力されていれば保存できる' do
      end
      it 'buildingは空であっても保存できる' do
      end
      it 'post_codeはハイフンを含んだ正しい形式で入力されていれば保存できる' do
      end
      it 'shipping_from_idは「---」以外を選択していれば保存できる' do
      end
      it 'cityが空でなければ保存できる' do
      end
      it 'block_numberが空でなければ保存できる' do
      end
      it 'phone_numberが11桁以内で入力且つハイフンなしであれば保存できる' do
      end
      it 'user_idが空でなければ保存できる' do
      end
      it 'item_idが空でなければ保存できる' do
      end
    end
    context '配送先情報の保存ができないとき' do
      it 'post_codeが空だと保存できない' do
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
      end
      it 'shipping_from_idを選択していないと保存できない' do
      end
      it 'cityが空だと保存できない' do
      end
      it 'block_numberが空だと保存できない' do
      end
      it 'phone_numberが空だと保存できない' do
      end
      it 'phone_numberは12桁以上だと保存できない' do
      end
      it 'phone_numberにハイフンがあると保存できない' do
      end
      it 'user_idが空だと保存できない' do
      end
      it 'item_idが空だと保存できない' do
      end
    end
  end
end
