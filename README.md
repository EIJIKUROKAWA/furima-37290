##usersテーブル

| Column             | Type     |   Options                 |
|--------------------|----------|---------------------------|
| nickname           | string   | null: false,              |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| name_kanji_last    | string   | null: false               |
| name_kanji_first   | string   | null: false               |
| name_kana_last     | string   | null: false               |
| name_kana_first    | string   | null: false               |
| birth              | date     | null: false               |

### Association
- has_many :items
- has_many :purchase_records

##itemsテーブル

| Column              |  Type     |   Options                     |        
|---------------------|-----------|-------------------------------|              
| item_name           | string    | null: false                   |
| item_text           | text      | null: false                   |
| item_category_id    | integer   | null: false                   |
| item_condition_id   | integer   | null: false                   |
| postage_included_id | integer   | null: false                   |
| price               | integer   | null: false                   |
| user                | references| null: false,foreign_key: true |
| area_id             | integer   | null: false                   |
| send_day_id         | integer   | null: false                   |
### Association

- belongs_to :user
- has_one :purchase_record

##purchase_recordsテーブル

| Column            |    Type    | Options                       |
|-------------------|------------|-------------------------------|
| item              | references | null:false, foreign_key: true |
| user              | references | null:false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

##shippingsテーブル

| Column            | Type       | Options                       |
|-------------------|------------|-------------------------------|
| shipping_number   | string     | null:false                    |
| area_id           | integer    | null:false                    |
| shipping_city     | string     | null:false                    |
| shipping_address  | string     | null:false                    |
| shipping_building | string     |                               |
| telephone_number  | string     | null:false                    |          
| purchase_record   | references | null:false, foreign_key: true |
### Association

- belongs_to :purchase_record

