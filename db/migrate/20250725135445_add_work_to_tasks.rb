class AddWorkToTasks < ActiveRecord::Migration[8.0]
  def change
    add_column :tasks, :work, :boolean, default: true
  end
end
