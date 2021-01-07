class OrderAddress
  
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :block_number, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :postal_code,    format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :municipalities
    validates :block_number
    validates :phone_number,   format: { with: /\A\d{11}\z/ }
  end

  validates :prefecture_id, presence: true, numericality: { other_than: 1 }

  #  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
  #    belongs_to :prefecture 
  #  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, block_number: block_number, building_name: building_name, phone_number: phone_number)
  end

end