FactoryBot.define do
  factory :item do
    association :user

    item_category_id       { 2 }
    item_condition_id      { 2 }
    postage_included_id    { 2 }
    price                  { 1000 }
    area_id                { 2 }
    send_day_id            { 2 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
