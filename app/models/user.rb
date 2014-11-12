class User < ActiveRecord::Base
    has_secure_password
    
    has_one :profile, dependent: :destroy
    accepts_nested_attributes_for :profile
    
    validates :name, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 3}
    validates :password_confirmation, presence: true
end
