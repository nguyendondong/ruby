class AddForeignKeyToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :user_id, foreign_key: true
  end
end
