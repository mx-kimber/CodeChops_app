class User < ApplicationRecord
  has_secure_password
  has_many :user_chops
  # has_many chops, through: :user_chops
end


