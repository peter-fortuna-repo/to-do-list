class AddTagsToTasksAndEmailGroupColumns < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :tag, :string
    add_column :email_groups, :body, :string
    add_column :email_groups, :frequency, :string
    add_column :email_groups, :day_of_week, :string
    add_column :email_groups, :time_of_day, :time
  end
end
