class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :mb_thread

  self.per_page = 12
end
