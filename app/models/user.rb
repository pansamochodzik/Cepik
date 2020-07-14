class User < ApplicationRecord
  # before_validation :create_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable, :lockable
  #
  # private
  #
  # def create_password
  #   self.password = (0...8).map { (65 + rand(26)).chr }.join
  #   self.password_confirmation = self.password
  # end
end
