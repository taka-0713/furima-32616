require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it "nameが存在すれば登録できること" do
          expect(@item).to be_valid
        end
      end
    
      context '商品出品がうまくいかないとき' do
        it "imageが空だと登録できない" do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end    
        it "nameが空だと登録できない" do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end
        it "describeが空だと登録できない" do
          @item.describe = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Describe can't be blank")
        end
        it "category_idが空だと登録できない" do
          @item.category_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
        end
        it "category_idが1だと登録できない" do
          @item.category_id = [1]
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
        end
        it "item_status_idが空だと登録できない" do
          @item.item_status_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Item status can't be blank", "Item status is not a number")
        end
        it "item_status_idが1だと登録できない" do
          @item.item_status_id = [1]
          @item.valid?
          expect(@item.errors.full_messages).to include("Item status can't be blank", "Item status is not a number")
        end
        it "shipping_cost_idが空だと登録できない" do
          @item.shipping_cost_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost can't be blank", "Shipping cost is not a number")
        end
        it "shipping_cost_idが1だと登録できない" do
          @item.shipping_cost_id = [1]
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping cost can't be blank", "Shipping cost is not a number")
        end
        it "prefecture_idが空だと登録できない" do
          @item.prefecture_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
        end
        it "prefecture_idが1だと登録できない" do
          @item.prefecture_id = [1]
          @item.valid?
          expect(@item.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
        end
        it "shipping_date_idが空だと登録できない" do
          @item.shipping_date_id = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping date can't be blank", "Shipping date is not a number")
        end
        it "shipping_date_idが1だと登録できない" do
          @item.shipping_date_id = [1]
          @item.valid?
          expect(@item.errors.full_messages).to include("Shipping date can't be blank", "Shipping date is not a number")
        end
        it "priceが空だと登録できない" do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not included in the list", "Price is invalid")
        end
        it "priceの範囲が¥300以上でないと登録できない" do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it "priceの範囲が¥9,999,999以下でないと登録できない" do
          @item.price = 10000000
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
        it "priceが半角数字でないと登録できない" do
          @item.price = "３００"
          @item.valid?
          expect(@item.errors.full_messages).to include("Price is not included in the list")
        end
      end 
    end       
  end
end
