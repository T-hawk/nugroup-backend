class ChangeUsernameInUserToBeUnique < ActiveRecord::Migration[6.0]
  def change
    change_column :user :username
  end
end
