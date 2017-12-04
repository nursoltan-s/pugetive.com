class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.id == 1
  end

  def email_address
    Email.first.address
  end

  def phone_number
    Phone.first.address
  end

  def address
    Address.first
  end


end
