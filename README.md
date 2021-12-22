##usersテーブル

| Column             | Type     |   Options                 |
|--------------------|----------|---------------------------|
| nickname           | string   | null: false, unique: true |
| emali              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| name_kanji         | string   | null: false               |
| name_kana          | string   | null: false               |
| birth              | date     | null: false               |

### Association

- has_many :items
- has_many :purchase_records

##itemsテーブル

| Column           |  Type     |   Options                     |        
|------------------|-----------|-------------------------------|              
| item_name        | string    | null: false                   |
| item_text        | text      | null: false                   |
| item_category    | string    | null: false                   |
| item_condition   | string    | null: false                   |
| postage_included | string    | null: false                   |
| price            | integer   | null: false                   |
| user             | references| null:false, foreign_key: true |
| from_area        | string    | null: false                   |
| item_image       | string    | null: false                   |


### Association

- belongs_to :user
- has_one :purchase_record

##purchase_recordテーブル

| Column     |    Type    | Options                       |
|------------|------------|-------------------------------|
| item       | references | null:false, foreign_key: true |
| user       | references | null:false, foreign_key: true |
| shipping   | references | null:false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- belongs_to :shipping

##shippingテーブル

| Column           | Type       | Options                       |
|------------------|------------|-------------------------------|
| shipping_number  | integer    | null:false                    |
| shipping_area    | string     | null:false                    |
| shipping_city    | string     | null:false                    |
| shipping_address | string     | null:false                    |
| shipping_building| string     | null:false                    |
| telephone_number | integer    | null:false                    |          
| user             | references | null:false, foreign_key: true |
| item             | references | null:false, foreign_key: true |

### Association

- has_many :purchase_records
