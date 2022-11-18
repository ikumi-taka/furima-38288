class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_from_id, :city, :block_number, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    #addressモデルのバリデーション
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_from_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :block_number
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "is valid"}

    #ordeモデルのバリデーション
    validates :user_id
    validates :item_id
    
    #tokenのバリデーション
    validates :token

  end

  def save
    #購入情報を保存し変数orderに代入する
    order = Order.create(user_id: user_id, item_id: item_id)
    #住所を保存する
    Address.create(post_code: post_code, shipping_from_id: shipping_from_id, city: city, block_number: block_number, building: building, phone_number: phone_number, order_id: order.id)
  end
end