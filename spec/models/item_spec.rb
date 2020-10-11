require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  
  context '商品の出品が成功する時' do
      it "image,name,description,category_id,status_id,burden_id,area_id,day_id,price,userの全ての要素がある時" do
        expect(@item).to be_valid
      end
      it "priceが半角数字のみ時だけ出品できる" do
        @item.price = "3333"
        expect(@item).to be_valid
      end
  end

  context '商品の出品が失敗する時' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと出品できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idを選択していないと出品できない" do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "category_idが0だと出品できない" do
        @item.category_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "status_idを選択していないと出品できない" do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it "status_idが0だと出品できない" do
        @item.status_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it "burden_idを選択していないと出品できない" do
        @item.burden_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden Select")
      end
      it "burden_idが0だと出品できない" do
        @item.burden_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden Select")
      end
      it "area_idを選択していないと出品できない" do
        @item.area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Area Select")
      end
      it "area_idが0だと出品できない" do
        @item.area_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Area Select")
      end
      it "day_idを選択していないと出品できない" do
        @item.day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day Select")
      end
      it "day_idが0だと出品できない" do
        @item.day_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Day Select")
      end
      it "priceが空だと出品できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが299円だと出品できない" do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが9,999,9991円だと出品できない" do
        @item.price = "99999991"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it "priceが全角数字だと出品できない" do
        @item.price = "３００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      it 'userが紐付いていないと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
  end
end
