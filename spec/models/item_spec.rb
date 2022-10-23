require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録ができるとき' do
      it 'すべての入力項目を入力していれば、登録できる' do
        expect(@item).to be_valid
      end
      it 'categoryは「---」以外を選択していれば登録できる' do
        @item.category_id = 2
        expect(@item).to be_valid
      end
      it 'item_statusは「---」以外を選択していれば登録できる' do
        @item.item_status_id = 2
        expect(@item).to be_valid
      end
      it 'shipping_costは「---」以外を選択していれば登録できる' do
        @item.shipping_cost_id = 2
        expect(@item).to be_valid
      end
      it 'shipping_fromは「---」以外を選択していれば登録できる' do
        @item.shipping_from_id = 2
        expect(@item).to be_valid
      end
      it 'shipping_timeは「---」以外を選択していれば登録できる' do
        @item.shipping_time_id = 2
        expect(@item).to be_valid
      end
      it '価格は半角数字で¥300~¥9,999,999の間を入力していれば登録できる' do
        @item.price = 5000
        expect(@item).to be_valid
      end
    end
    context '商品出品登録ができないとき' do
      it 'ログインしていないと出品登録をすることができない' do
        @item.user_id = 'nil'
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it '商品画像を1枚添付していないと登録できない' do
        @item.image = nil
        @item.valid?

        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明が空だと登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが「---」を選択していると登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態が「---」を選択していると登録できない' do
        @item.item_status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end
      it '配送料の負担が「---」を選択していると登録できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost can't be blank")
      end
      it '発送元の地域が「---」を選択していると登録できない' do
        @item.shipping_from_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping from can't be blank")
      end
      it '発送までの日数が「---」を選択していると登録できない' do
        @item.shipping_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank")
      end
      it '販売価格が空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '販売価格が299円以下だと登録できない' do
        @item.price = 10
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it '販売価格が10,000,000円以上だと登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it '' do
      end
    end
  end
end
