class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.integer :status, null: false, index: true, default: 0
      t.date :start_date, null: false, index: true
      t.date :end_date, null: false, index: true

      t.timestamps
    end
  end
end
