class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :good
      t.text :bad
      t.text :improvement 
      t.integer :user_id
      t.integer :day_id, foreign_key: true
      t.integer :month_id, foreign_key: true

      t.timestamps
    end
  end
end
