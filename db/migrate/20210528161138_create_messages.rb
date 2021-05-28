class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :chat, foreign_key: true
      t.string :sender_first_name
      t.text :body

      t.timestamps
    end
  end
end
