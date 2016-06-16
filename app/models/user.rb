class User < ActiveRecord::Base

  def password
    @password ||= BCrypt::Password.new(encrypted_password)
  end

#called with password="likebikes"
  def password=(new_password)
    #creates new bcrypt of password
    @password = BCrypt::Password.create(new_password)
    #saves password into encrypted password
    self.encrypted_password = @password
  end

  def authenticate(password)
    self.password == password
  end
end
