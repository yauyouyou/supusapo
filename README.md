# テーブル設計 

## users テーブル 

| Column                  | Type    | Options     | 
| ----------------------- | ------- | ----------- | 
| firstname               | string  | null: false | 
| lastname                | string  | null: false | 
| email                   | string  | null: false,unique: true | 
| encrypted_password      | string  | null: false | 

### Association 

- has_many :clients


## clientsテーブル

| Column                  | Type    | Options     | 
| ------------------------| --------| ------------| 
| client_firstname        | string  | null: false | 
| client_lastname         | string  | null: false | 
| client_firstname_kana   | string  | null: false |
| client_lastname_kana    | string  | null: false |
| birthday                | date    | null: false | 
| gender_id               | integer | null: false |
| post_code               | string  | null: false | 
| prefecture_id           | integer | null: false |
| municipality            | string  | null: false |
| address                 | string  | null: false |
| building_name           | string  |             |
| phone_number            | string  |             |
| mobile_number           | string  |             |
| company_name            | string  |             |
| project                 | text    |             |
| note                    | text    |             |

### Association 

- belongs_to :user


