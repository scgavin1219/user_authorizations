class User < ApplicationRecord
    attr_reader :password

    validates :username, presence: true, uniqueness: true
    validates :password_digest, presence: { message: 'Password can\'t be blank'}
    validates :password, length: { minimum: 6, allow_nil: true }

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(password_digest).is_password?(password)
    end

    def self.find_by_credentials(username, password)
        user = User.find_by(username: username)
            return nil if user.nil? 
        user.is_password?(password) ? user : nil
    end
end
