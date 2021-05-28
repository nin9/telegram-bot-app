class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :first_name
      t.string :last_name, null: true
      t.string :telegram_id, index: true, unique: true
      t.bigint :offset, default: 0

      t.timestamps
    end
  end
end
