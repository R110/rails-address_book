class AddEmailAddressToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :email_address, :string
  end
end
