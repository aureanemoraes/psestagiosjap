class AddAdmin2ToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admin2, :boolean
  end
end
