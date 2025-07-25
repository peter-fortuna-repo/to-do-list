class Task < ApplicationRecord
    validates :title, presence: true
    validates :completed, inclusion: { in: [true, false] }
    validates :work, inclusion: { in: [true, false] }
    belongs_to :day
end