class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :follower
      t.references :following

      t.timestamps null: false
    end
  end
end
