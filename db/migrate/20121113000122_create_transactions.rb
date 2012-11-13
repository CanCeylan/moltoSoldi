class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :friend_id
      t.integer :amount
      t.integer :type
      t.date :deadline

      t.timestamps
    end
  end
end
