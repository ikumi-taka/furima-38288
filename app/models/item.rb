class Item < ApplicationRecord
  has_one :order
  belongs_to :user

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_from
  belongs_to :shipping_time

  with_options numericality: { other_than: 1, message: "can't be blank" } do  # 選択肢「---」が選ばれているときは保存しない
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :shipping_from_id
    validates :shipping_time_id
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
  end

  validates :price,
    presence: true,
    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :price, numericality: { message: 'Half-width number' }

end
