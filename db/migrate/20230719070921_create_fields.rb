class CreateFields < ActiveRecord::Migration[7.0]
  def change
    create_table :fields do |t|
      t.string :title
      t.text :content
      t.references :client_detail, null: false, foreign_key: true

      t.timestamps
    end
  end
end
