class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :total_posts
      t.string :password

      t.timestamps null: false
    end
  end
end
