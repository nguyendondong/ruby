class CreateImageposts < ActiveRecord::Migration[5.2]
  def change
    create_table :imageposts do |t|
      t.string :item_id
      t.string :photo

      t.timestamps
    end
  end
end
