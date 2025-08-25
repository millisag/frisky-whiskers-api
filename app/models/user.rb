class User < ApplicationRecord

    has_many :cats, dependent: :destroy

    validates :first_name, :last_name, :email, :username, presence: true
    validates :email, uniqueness: true
    validates :username, uniqueness: true
end
