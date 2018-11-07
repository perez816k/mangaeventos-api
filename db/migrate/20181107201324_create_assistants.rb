class CreateAssistants < ActiveRecord::Migration[5.1]
  def change
    create_table :assistants do |t|
      t.integer :user_id
      t.integer :event_id
      t.boolean :pay_entry
      t.boolean :auth_delivered
      t.boolean :auth_revised
      t.boolean :paid_out

      t.timestamps
    end
  end
end
