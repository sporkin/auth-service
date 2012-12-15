class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name
  attr_accessor :password

  before_save :encrypt_password

  validates :password, :presence => true, :confirmation => true
  validates :email, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true

  def name
    "#{first_name} #{last_name}"
  end

  def to_builder
    user = Jbuilder.new
    user.(self, :name, :email)
    user
  end

  private
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.encrypted_password = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
