class EmailGroup < ApplicationRecord
    has_many :users_email_groups
    has_many :users, through: :users_email_groups
    belongs_to :creator, class_name: "User"

    has_rich_text :body

    validates :name, presence: true
    validates :creator_id, presence: true
    validates :body, presence: true
    validates :day_of_week, presence: true
    validates :time_of_day, presence: true
    validates :private, inclusion: {in: [true, false]}
end