class CreateCalenders < ActiveRecord::Migration[5.2]
  def change
    create_table :calenders do |t|
      t.integer  :data_win,  null:false
      t.integer  :data_lose,  null:false
      t.integer  :user_id

      t.timestamps
    end
  end
end
