class AddFavoriteStatusToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :favorite_status, :string
    add_column :contacts, :string, :string
  end
end
