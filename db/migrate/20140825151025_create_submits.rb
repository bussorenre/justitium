class CreateSubmits < ActiveRecord::Migration
  def change
    create_table :submits do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.string :result
      t.integer :try_count

      t.timestamps
    end
  end
end
