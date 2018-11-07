class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.text :name
      t.text :description
      t.date :date
      t.text :location
      t.text :address
      t.float :price_ti
      t.float :price_bus
      t.text :state

      t.timestamps
    end
  end
end
