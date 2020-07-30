class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :validatable, :lockable, :confirmable

  def is_admin?
    admin?
  end

  protected

  def password_required?
    confirmed? ? super : false
  end
end
