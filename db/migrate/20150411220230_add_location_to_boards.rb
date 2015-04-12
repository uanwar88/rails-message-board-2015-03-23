class AddLocationToBoards < ActiveRecord::Migration
  def change
    add_reference :boards, :location, index: true
    add_foreign_key :boards, :locations
  end
end
