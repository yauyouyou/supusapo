class CreateClientDetails < ActiveRecord::Migration[7.0]
  def change
    create_table :client_details do |t|

      t.timestamps
    end
  end
end
