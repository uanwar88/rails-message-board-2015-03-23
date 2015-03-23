class User < ActiveRecord::Base
  has_many :posts
  has_many :mb_threads

  has_secure_password
  validates_presence_of :password
  validates_uniqueness_of :username

end
