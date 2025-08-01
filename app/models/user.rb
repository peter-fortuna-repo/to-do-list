class User < ApplicationRecord
    has_many :users_email_groups
    has_many :email_groups, through: :users_email_groups
    has_many :tasks, inverse_of: :user

    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

    validates :username, presence: true, uniqueness: {case_sensitive: false}
    validates :email, presence: true, uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true
    validates :admin, inclusion: {in: [true, false]}
end