class OrderAddress
  include ActiveModel::Model
  aatr_accessor :post_code, :shipping_from_id, :city, :block_number, :building, :phone_number, :order_id, :user_id, :item_id

  with_options presence: true do
    #addressモデルのバリデーション
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_from_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :block_number
    validates :phone_number, format: {with: /\A[0-9]+\z/, message: "is valid"}

    #ordeモデルのバリデーション
    validates :user_id
    validates :item_id
  end
end