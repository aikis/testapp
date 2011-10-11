class AddInviteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invite, :string
  end
end
