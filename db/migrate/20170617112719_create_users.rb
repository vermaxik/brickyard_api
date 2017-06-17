class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password_digest
      t.integer :role, default: 0
      t.string :token, index: true

      t.timestamps
    end
  end
end
