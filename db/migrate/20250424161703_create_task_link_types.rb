class CreateTaskLinkTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :task_link_types do |t|
      t.string :name, null: false
      t.string :source_relationship, null: false
      t.string :target_relationship, null: false

      t.timestamps
    end

    add_index :task_link_types, :name, unique: true
  end
end
