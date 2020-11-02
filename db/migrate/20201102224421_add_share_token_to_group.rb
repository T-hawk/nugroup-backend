class AddShareTokenToGroup < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :share_token, :string
  end
end
