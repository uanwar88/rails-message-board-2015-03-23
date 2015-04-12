class Board < ActiveRecord::Base
  has_many :mb_threads
  belongs_to :location
end
