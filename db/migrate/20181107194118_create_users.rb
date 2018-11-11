class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.text :name
      t.text :email
<<<<<<< HEAD
=======
      t.text :password
>>>>>>> f356eae0d7ad0ef6aefc04aa696a01c0b5f21bfc
      t.text :phone
      t.date :birthdate

      t.timestamps
    end
  end
end
