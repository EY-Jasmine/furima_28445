require 'rails_helper'

RSpec.describe DeliveryBuy, type: :model do
  before do
    @delivery_buy = FactoryBot.build(:delivery_buy)
  end

  it 'すべての値が正しく入力されていれば保存できること' do
    expect(@delivery_buy).to be_valid
  end
  it 'zip_codeが空だと保存できないこと' do
    @delivery_buy.zip_code = nil
    @delivery_buy.valid?
    expect(@delivery_buy.errors.full_messages).to include("Zip code can't be blank")
  end
  it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
    @delivery_buy.zip_code = '1234567'
    @delivery_buy.valid?
    expect(@delivery_buy.errors.full_messages).to include('Zip code is invalid')
  end
  it 'prefectureが未選択だと保存できないこと' do
    @delivery_buy.prefecture_id = 1
    @delivery_buy.valid?
    expect(@delivery_buy.errors.full_messages).to include('Prefecture must be other than 1')
  end
  it 'cityが空だと保存できないこと' do
    @delivery_buy.city = nil
    @delivery_buy.valid?
    expect(@delivery_buy.errors.full_messages).to include("City can't be blank")
  end
  it 'addressが空だと保存できないこと' do
    @delivery_buy.address = nil
    @delivery_buy.valid?
    expect(@delivery_buy.errors.full_messages).to include("Address can't be blank")
  end
  it 'buildingは空でも保存できること' do
    @delivery_buy.building = nil
    expect(@delivery_buy).to be_valid
  end
  it 'telが空だと保存できないこと' do
    @delivery_buy.tel = nil
    @delivery_buy.valid?
    expect(@delivery_buy.errors.full_messages).to include("Tel can't be blank")
  end
  it 'telは記号を含んでいると保存できないこと' do
    @delivery_buy.tel = '090-1234-5678'
    @delivery_buy.valid?
    expect(@delivery_buy.errors.full_messages).to include('Tel is invalid')
  end

  it 'priceとtokenがあれば保存ができること' do
    expect(@delivery_buy).to be_valid
  end
  it 'tokenが空では登録できないこと' do
    @delivery_buy.token = nil
    @delivery_buy.valid?
    expect(@delivery_buy.errors.full_messages).to include("Token can't be blank")
  end
end
