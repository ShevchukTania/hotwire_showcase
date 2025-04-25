class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :name, null: false, limit: 255
      t.text :description
      t.date :due_date, null: false, index: true
      t.integer :status, null: false, default: 0, index: true
      t.references :project, null: false, foreign_key: true, index: true
      t.datetime :completed_at, index: true

      t.timestamps
    end
  end
end
