class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :block_number, :building_name, :phone_number

  with_options presence: true do
    validates :postal_code,    format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipalities
    validates :block_number
    validates :phone_number,   format: { with: /\A\d{11}\z/ }

  validates :prefecture_id, presence: true, numericality: { other_than: 1 }

  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :prefecture
  end

  def save
    Order.create(user_id: user.id, item_id: item.id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, block_number: block_number, building_name: building_name, order_id: order.id)
  end

end