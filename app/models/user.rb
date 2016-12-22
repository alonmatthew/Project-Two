class User < ActiveRecord::Base
  has_secure_password
  has_many :image
  has_many :comment, through: :image
end
