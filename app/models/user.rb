class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates_length_of :password, minimum: 6
  has_secure_password
  

  def self.authenticate_with_credentials(email, password)
    user = find_by(email: email.downcase.strip)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end