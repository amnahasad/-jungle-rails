class User < ActiveRecord::Base

    has_secure_password

    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, presence: true, uniqueness: {case_sensitive: false}
    validates :password, presence: true
    validates :password_digest, presence: true

def name
 first_name
end

end
