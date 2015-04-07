class Board < ActiveRecord::Base
  has_many :mb_threads
  belongs_to :locations
end
