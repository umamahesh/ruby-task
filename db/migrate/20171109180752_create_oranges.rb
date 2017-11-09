class CreateOranges < ActiveRecord::Migration[5.1]
  def change
    create_table :oranges do |t|
      t.string :name
      t.timestamps
    end
  end
end
