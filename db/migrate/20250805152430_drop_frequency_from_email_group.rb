class DropFrequencyFromEmailGroup < ActiveRecord::Migration[8.0]
  def change
    remove_column :email_groups, :frequency
  end
end
