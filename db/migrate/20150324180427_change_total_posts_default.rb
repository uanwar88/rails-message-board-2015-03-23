class ChangeTotalPostsDefault < ActiveRecord::Migration
  def change
    change_column_default :users, :total_posts, 0
  end
end
