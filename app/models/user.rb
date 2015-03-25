class User < ActiveRecord::Base
  has_many :posts
  has_many :mb_threads

  has_secure_password validations:false

  validates_uniqueness_of :username

end
