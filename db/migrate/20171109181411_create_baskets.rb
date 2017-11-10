class CreateBaskets < ActiveRecord::Migration[5.1]
  def change
    create_table :baskets do |t|
      t.integer :capacity, default: 0
      t.string :fill_rate
      t.timestamps
    end
  end
end
