class AddPrivateColumnToEmailGroup < ActiveRecord::Migration[8.0]
  def change
    add_column :email_groups, :private, :boolean, default: false
  end
end
