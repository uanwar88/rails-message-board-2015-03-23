class MbThread < ActiveRecord::Base
  belongs_to :board
  belongs_to :user
  has_many :posts, dependent: :delete_all

  self.per_page = 12
end
