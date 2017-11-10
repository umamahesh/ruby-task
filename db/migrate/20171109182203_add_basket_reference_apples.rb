class AddBasketReferenceApples < ActiveRecord::Migration[5.1]
  def change
  	add_column :apples, :basket_id, :integer
  	add_column :apples, :variety, :string
  end
end
