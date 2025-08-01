class RefactorForEmailGroups < ActiveRecord::Migration[8.0]
  def change
    create_table :email_groups do |t|
      t.string :name
      t.integer :user_id
      t.timestamps
    end

    create_table :users do |t|
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :password
      t.string :email
      t.string :password_digest
      t.boolean :admin
      t.timestamps
    end

    create_table :users_email_groups do |t|
      t.integer :email_group_id
      t.integer :user_id
      t.timestamps
    end

    add_column :tasks, :date, :date
    add_column :tasks, :user_id, :integer
    remove_column :tasks, :day_id
    drop_table :days
  end
end
