class CreateItemphotos < ActiveRecord::Migration[5.2]
  def change
    create_table :itemphotos do |t|
      t.integer :item_id
      t.string :photo

      t.timestamps
    end
  end
end
