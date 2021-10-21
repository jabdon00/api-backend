require 'jwt'
module Rw
  class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
           
    def generate_jwt
      JWT.encode({id: id, exp: 60.days.from_now.to_i}, Rails.application.secrets.secret_key_base)
    end

    def admin?
      self.user_type == 1
    end

    def user?
      self.user_type == 2
    end
  end
end
