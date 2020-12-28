class Item < ApplicationRecord

  belongs_to :user

  has_one_attached :image

  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :category
    belongs_to :item_status
    belongs_to :shipping_cost
    belongs_to :prefecture
    belongs_to :shipping_date
  end

end
