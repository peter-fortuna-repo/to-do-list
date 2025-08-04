# filepath: /Users/peterfortuna/Desktop/projects/to-do-list/app/models/users_email_group.rb
class UsersEmailGroup < ApplicationRecord
  belongs_to :user
  belongs_to :email_group
end