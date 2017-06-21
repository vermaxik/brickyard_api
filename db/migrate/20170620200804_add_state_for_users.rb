class AddStateForUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :main_id, :integer, default: 1, index: true
  end
end
