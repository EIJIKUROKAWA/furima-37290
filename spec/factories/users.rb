FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email                 { 'hoge@huga' }
    password              { '11111q' }
    password_confirmation { password }
    name_kanji_last       { '山田' }
    name_kanji_first      { '太朗' }
    name_kana_last        { 'ヤマダ' }
    name_kana_first       { 'タロウ' }
    birth                 { '1930-01-01' }
  end
end
