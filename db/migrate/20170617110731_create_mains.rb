class CreateMains < ActiveRecord::Migration[5.1]
  def change
    create_table :mains do |t|
      t.string :state
      t.integer :position, default: 0, index: true

      t.timestamps
    end
  end
end
