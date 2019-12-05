class CreateData < ActiveRecord::Migration[5.2]
  def change
    create_table :data do |t|
      t.integer  :user_id
      t.integer  :pips,  null:false

      t.timestamps
    end
  end
end
