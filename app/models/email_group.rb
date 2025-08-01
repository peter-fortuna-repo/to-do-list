class EmailGroup < ApplicationRecord
    has_many :users_email_groups
    has_many :users, through: :users_email_groups

    validates :name, presence: true
    validates :user_id, presence: true
    validates :body, presence: true
    validates :frequency, presence: true
    validates :day_of_week, presence: true
    validates :time_of_day, presence: true
end