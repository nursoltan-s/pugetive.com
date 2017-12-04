class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.id == 1
  end

  def email
    Email.first
  end

  def phone
    Phone.first
  end

  def address
    Address.first
  end


end
