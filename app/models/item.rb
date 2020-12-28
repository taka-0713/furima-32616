class Item < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :describe
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :item_status_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :shipping_date_id
  end

  validates :price, presence: true, 
                    inclusion: {in: 300..9999999 }, 
                    format: { with: /\A[0-9]+\z/ }

  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :category
    belongs_to :item_status
    belongs_to :shipping_cost
    belongs_to :prefecture
    belongs_to :shipping_date
  end

  belongs_to :user

  has_one_attached :image

end
