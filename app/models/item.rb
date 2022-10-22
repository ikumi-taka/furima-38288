class Item < ApplicationRecord
  extend ActiveHAsh::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :shipping_cost
  belongs_to :shipping_from
  belongs_to :shipping_time

  has_one_attached :image
end
