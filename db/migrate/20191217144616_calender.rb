class Calender < ActiveRecord::Migration[5.2]
  def change
    add_column :calenders, :title, :string
    add_column :calenders, :start, :datetime 
    add_column :calenders, :end, :datetime 
  end
end
