class ChangeEmailGroupDataTypeToString < ActiveRecord::Migration[8.0]
  def change
    remove_column :email_groups, :time_of_day
    add_column :email_groups, :time_of_day, :string, default: "07:00" 
  end
end
