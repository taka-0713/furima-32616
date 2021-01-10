class Address < ApplicationRecord

  with_options extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :prefecture 
  end
  
  belongs_to :order

end
