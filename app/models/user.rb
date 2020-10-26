class User < ActiveRecord::Base
    has_secure_password

    has_many :lessons

    validates :name, :state, presence: true
    validates :email, uniqueness: true
end