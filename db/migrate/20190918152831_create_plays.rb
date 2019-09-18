class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :formation
      t.string :name
      t.string :setup
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
