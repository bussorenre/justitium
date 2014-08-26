class AddContentToSubmits < ActiveRecord::Migration
  def change
    add_column :submits, :content, :binary
  end
end
