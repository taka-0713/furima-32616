require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id )
      sleep 0.1
    end

    describe '商品購入機能' do
      context '商品購入がうまくいくとき' do
        it "tokenとpostal_codeが存在すれば登録できる" do
          expect(@order_address).to be_valid
        end
        it "building_nameが空でも登録できる" do
          @order_address.building_name = nil
          expect(@order_address).to be_valid
        end
      end

      context '商品購入がうまくいかないとき' do
        it "tokenが空だと登録できない" do
          @order_address.token = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Token can't be blank")
        end
        it "postal_codeが空だと登録できない" do
         @order_address.postal_code = nil
         @order_address.valid?
         expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
        end
        it "postal_codeはハイフンがないと登録できない" do
          @order_address.postal_code = "1234567"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Postal code is invalid")
        end
        it "prefecture_idが1だと登録できない" do
          @order_address.prefecture_id = [1]
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Prefecture is not a number")
        end
        it "municipalitiesが空だと登録できない" do
          @order_address.municipalities = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
        end
        it "block_numberが空だと登録できない" do
          @order_address.block_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Block number can't be blank")
        end
        it "phone_numberが空だと登録できない" do
          @order_address.phone_number = nil
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
        end
        it "phone_numberは11桁以内でないと登録できない" do
          @order_address.phone_number = "090-1234-5678"
          @order_address.valid?
          expect(@order_address.errors.full_messages).to include("Phone number is invalid")
        end
        it "user_idが空だと登録できない" do
          @order_address.user_id = nil
          @order_address.valid? 
          expect(@order_address.errors.full_messages).to include("User can't be blank")
        end
        it "item_idが空だと登録できない" do
          @order_address.item_id = nil
          @order_address.valid? 
          expect(@order_address.errors.full_messages).to include("Item can't be blank")
        end
      end
    end
  end
end