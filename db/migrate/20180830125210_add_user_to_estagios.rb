class AddUserToEstagios < ActiveRecord::Migration[5.2]
  def change
    add_reference :estagios, :user, foreign_key: true
  end
end
