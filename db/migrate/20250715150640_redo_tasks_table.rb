class RedoTasksTable < ActiveRecord::Migration[8.0]
  def change
    drop_table :tasks, if_exists: true

    create_table :tasks do |t|
      t.string :title, null: false
      t.boolean :completed, default: false, null: false
    end
  end
end
