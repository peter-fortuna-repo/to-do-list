class CreateDays < ActiveRecord::Migration[8.0]
  def change
    create_table :days do |t|
      t.date :date
      t.timestamps
    end
    add_column :tasks, :day_id, :int
  end
end
