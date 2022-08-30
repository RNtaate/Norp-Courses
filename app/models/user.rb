class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
  
  rolify

  has_many :courses

  def username
    if self.email.present?
        self.email.split("@").first   
    end
  end
end
