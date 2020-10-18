require 'rails_helper'

RSpec.describe OrderForm, type: :model do
    before do
      buyer = FactoryBot.create(:user)
      seller = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: seller.id)
      @order_form = FactoryBot.build(:order_form, user_id: buyer.id, item_id: item.id)
      sleep 1
    end

    context '商品の購入が成功する時' do
      it "postal_code,area_id,city,house_number,building_name,phone_number,token,user_id,item_idが存在すれば購入できる" do
        expect(@order_form).to be_valid
      end
      it "building_nameがなくても購入ができる" do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
      it "item_idが紐づいていない場合は購入できる" do
        @order_form.item_id = nil
        expect(@order_form).to be_valid
      end
      it "user_idが紐づいていない場合は購入できる" do
        @order_form.user_id = nil
        expect(@order_form).to be_valid
      end
    end

    context '商品の購入が失敗する時' do
      it "tokenがないと商品が購入できない" do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeがないと購入できない" do
        @order_form.postal_code = ""
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it "postal_codeにハイフンがないと購入できない" do
        @order_form.postal_code = "1234567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeに前半が2桁の時はと購入できない" do
        @order_form.postal_code = "12-4567"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "postal_codeに後半が3桁の時はと購入できない" do
        @order_form.postal_code = "123-456"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code Input correctly")
      end
      it "area_idがないと商品が購入できない" do
        @order_form.area_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Area Select")
      end
      it "area_idが0だと商品が購入できない" do
        @order_form.area_id = "0"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Area Select")
      end
      it "cityが空と商品が購入できない" do
        @order_form.city = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it "house_numberが空と商品が購入できない" do
        @order_form.house_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("House number can't be blank")
      end
      it "phone_numberが空と商品が購入できない" do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが9桁だと商品が購入できない" do
        @order_form.phone_number = "123456789"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberが数字以外だと商品が購入できない" do
        @order_form.phone_number = "あああああああああああ"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
      it "phone_numberにハイフンが入ってると商品が購入できない" do
        @order_form.phone_number = "1234-678901"
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number Input only number")
      end
    end
end
