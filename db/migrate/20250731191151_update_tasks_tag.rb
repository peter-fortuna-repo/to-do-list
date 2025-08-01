class UpdateTasksTag < ActiveRecord::Migration[8.0]
  def change
    remove_column :tasks, :tag
    add_column :tasks, :tag, :string, default: "None"
  end
end
