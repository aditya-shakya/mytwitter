class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  validates :username, :presence => true,
            :uniqueness => {:case_sensitive => false}
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true


  has_many :tweets
  has_many :followers

  # def login=(login)
  #   @login = login
  # end
  #
  # def login
  #   @login || self.username || self.email
  # end

  # def self.find_for_database_authentication warden_conditions
  #   conditions = warden_conditions.dup
  #   login = conditions.delete(:login)
  #   where(conditions).where(["lower(username) = :value OR lower(email) = :value", {value: login.strip.downcase}]).first
  # end
end
