class RemoveColumnFromFoods < ActiveRecord::Migration[5.1]
  def change
  	  remove_column :foods, :name, :string
  end
end
