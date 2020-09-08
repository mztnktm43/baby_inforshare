FactoryBot.define do
  factory :item do
    name { '商品名' }
    detail { '説明' }
    category_id { '2' }
    age_year_id { '2' }
    age_month_id { '2' }
    size { 50 }
    price { 1000 }
    association :user
  end
end
