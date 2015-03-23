class CreateMbThreads < ActiveRecord::Migration
  def change
    create_table :mb_threads do |t|
      t.string :title
      t.references :board, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :mb_threads, :boards
    add_foreign_key :mb_threads, :users
  end
end
