class CreateTaskLinks < ActiveRecord::Migration[8.0]
  def change
    create_table :task_links do |t|
      t.references :source_task, null: false, foreign_key: { to_table: :tasks }
      t.references :target_task, null: false, foreign_key: { to_table: :tasks }
      t.references :link_type, null: false, foreign_key: { to_table: :task_link_types }

      t.timestamps

      t.index [:source_task_id, :target_task_id, :link_type_id], name: 'idx_unique_task_links'

      t.index [:source_task_id, :target_task_id],
              unique: true,
              name: 'idx_source_target_task_links'
    end
  end
end