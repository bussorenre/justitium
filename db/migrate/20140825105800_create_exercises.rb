class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :unique_name
      t.string :title
      t.text :content_body

      t.timestamps
    end
  end
end
