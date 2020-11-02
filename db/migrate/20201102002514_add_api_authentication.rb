class AddApiAuthentication < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :auth_token, :string, null: false
  end
end
