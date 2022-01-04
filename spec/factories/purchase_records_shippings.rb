FactoryBot.define do
  factory :purchase_record_shipping do
    shipping_number  { '000-0000' }
    area_id          { 1 }
    shipping_city    { '札幌市' }
    shipping_address { '５５５' }
    shipping_building { '札幌ビル４０８' }
    telephone_number { 99_011_111_111 }
    token            { '1_111_111_111_111' }
  end
end
