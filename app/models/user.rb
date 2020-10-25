class User < ActiveRecord::Base
    has_secure_password

    has_many :lessons

    validates :email, :name, :state, presence: true
    
end