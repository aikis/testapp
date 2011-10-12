class AddInviteFromToUsers < ActiveRecord::Migration
  def change
    add_column :users, :invitefrom, :string
  end
end
