class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.references :user, index: true
      t.references :exercise, index: true
      t.integer :level
      t.integer :meta
      t.integer :certification

      t.timestamps
    end
  end
end
