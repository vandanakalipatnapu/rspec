class RemovePhnoFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :phno, :string
  end
end
