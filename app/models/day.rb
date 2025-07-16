class Day < ApplicationRecord
    validates :date, presence: true, uniqueness: true
    has_many :tasks
end