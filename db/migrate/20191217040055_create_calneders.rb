class CreateCalneders < ActiveRecord::Migration[5.2]
  def change
    create_table :calneders do |t|

      t.timestamps
    end
  end
end
