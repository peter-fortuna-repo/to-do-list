class RemoveWorkTasks < ActiveRecord::Migration[8.0]
  def change
    remove_column :tasks, :work
  end
end
