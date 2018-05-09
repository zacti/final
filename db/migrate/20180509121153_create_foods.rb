class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
    	t.integer :user_id, index: true
  		t.string :name, null:false
  		t.string :price
  		t.string :location
  		t.string :description
    end
  end
end
