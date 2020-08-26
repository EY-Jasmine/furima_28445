require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品情報新規登録' do
    context '新規登録がうまくいくとき' do
      it "name ,detail, category, condition, delivery_fee, prefecture, day, price, imageが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "画像が空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image ファイルを添付してください")
      end
      it "商品名が空では登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が空では登録できない" do
        @item.detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it "カテゴリーの状態が、「ーー」では登録できない" do
        @item.category = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "商品の状態が、「ーー」では登録できない" do
        @item.condition = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "配送料の負担が、「ーー」では登録できない" do
        @item.delivery_fee = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "発送元の地域が、「ーー」では登録できない" do
        @item.prefecture = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "発送までの日数が、「ーー」では登録できない" do
        @item.day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "価格の範囲が￥300より安い場合は登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "価格の範囲が￥9,999,999より高い場合は登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
