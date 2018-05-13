class AddColumnToFood < ActiveRecord::Migration[5.1]
  def change
  	add_column :foods, :item, :string
  end
end
