FactoryBot.define do
  factory :order_form do
      postal_code { '123-4567' }
      area_id { 1 }
      city { '市町村' }
      house_number { '家の住所' }
      building_name { '補足住所' }
      phone_number { '12345678901' }
      token {"tok_abcdefghijk00000000000000000"}
      
      association :user
      association :item
  end
end
