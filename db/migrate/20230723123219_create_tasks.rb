class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :deadline
      t.integer :priority
      t.boolean :is_complete

      t.timestamps
    end
  end
end
