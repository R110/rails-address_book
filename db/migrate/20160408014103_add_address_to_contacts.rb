class AddAddressToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :address, :text
  end
end
