class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessor :login
  validates :username, presence: true
  validates :username, length: {minimum: 4}
  validates :username, format: /\A[\w@\-\.]+\z/
  validates :username, uniqueness: { case_sensitive: false }


  before_validation :set_username


  def set_username
  	self.username = self.first_name + self.family_name
  end


  def valid_email
    self.email =~ /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  end

    #related to devise overrides to allow login via either email or username
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["LOWER(username) = :value OR LOWER(email) = :value", { value: login.downcase.strip }]).last
    else
      conditions[:email].downcase!.strip if conditions[:email]
      conditions[:username].downcase!.strip if conditions[:username]
      where(conditions.to_hash).last
    end
  end

end
