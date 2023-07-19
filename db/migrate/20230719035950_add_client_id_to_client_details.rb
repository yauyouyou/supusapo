class AddClientIdToClientDetails < ActiveRecord::Migration[7.0]
  def change
    add_column :client_details, :client_id, :integer
  end
end
