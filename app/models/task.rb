class Task < ApplicationRecord
    belongs_to :user, inverse_of: :tasks

    validates :user_id, presence: true
    validates :title, presence: true
    validates :completed, inclusion: { in: [true, false] }
    validates :date, presence: true
    validates :tag, presence: true
end