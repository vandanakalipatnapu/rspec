class CreateColleges < ActiveRecord::Migration
  def change
    create_table :colleges do |t|
    	t.string :name
    	t.string :location
    	t.string :email
    	t.string :phno

      t.timestamps null: false
    end
  end
end
