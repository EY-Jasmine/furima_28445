FactoryBot.define do
  factory :delivery_buy do
    zip_code { '123-4567' }
    prefecture_id { 2 }
    city { 'さいたま市浦和区' }
    address { '高砂1-1-1' }
    building { 'うらわ荘' }
    tel { '09012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
