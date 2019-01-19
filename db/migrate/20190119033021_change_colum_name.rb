class ChangeColumName < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :user_ID, :user_id
  end
end
