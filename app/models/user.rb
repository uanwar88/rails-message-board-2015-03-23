class User < ActiveRecord::Base
  has_many :posts
  has_many :mb_threads

  has_secure_password

  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true, length: { minimum: 5 }
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /@/
end
