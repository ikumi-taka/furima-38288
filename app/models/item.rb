class Item < ApplicationRecord
  extend ActiveHAsh::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_from
  belongs_to :shipping_time

  has_one_attached :image

  with_options numericality: { other_than: 1, message: "can't be blank" } do  #選択肢「---」が選ばれているときは保存しない
    validates :category
    validates :item_status
    validates :shipping_cost
    validates :shipping_from
    validates :shipping_time
  end
  
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_from_id
    validates :shipping_time_id
    validates :user_id
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end
end
