class UpdateEmailGroupColumns < ActiveRecord::Migration[8.0]
  def change
    remove_column :email_groups, :user_id
    add_column :email_groups, :creator_id, :integer
  end
end
