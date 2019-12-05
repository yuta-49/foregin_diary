class CreateNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :numbers do |t|
      t.integer  :win,  null:false
      t.integer  :lose,  null:false
      t.integer  :user_id
      t.timestamps
    end
  end
end
