class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table  :clients do |t|
      t.string    :client_firstname, null: false
      t.string    :client_lastname, null: false
      t.string    :client_firstname_kana, null: false
      t.string    :client_lastname_kana, null: false
      t.date      :birthday, null: false
      t.integer   :gender_id, null: false
      t.string    :post_code, null: false
      t.integer   :prefecture_id, null: false
      t.string    :municipality, null: false
      t.string    :address, null: false
      t.string    :building_name
      t.string    :phone_number
      t.string    :mobile_number
      t.string    :company_name
      t.text      :project
      t.text      :note

      t.timestamps
    end
  end
end
