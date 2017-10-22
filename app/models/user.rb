class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum role: {client: 0, staff: 1, manager: 2, admin: 3}

  def self.at_my_level(current_user)
    role = current_user.role
    return User.joins(:profile).where(role: role)
  end

end
