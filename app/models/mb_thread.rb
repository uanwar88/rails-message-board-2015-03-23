class MbThread < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  has_many :posts, dependent: :delete_all
end
