class CreateActivityLogs < ActiveRecord::Migration[5.1]
  def up
    create_table :activity_logs do |t|
    	t.string :controller
    	t.string :action
    	t.text :params
    	t.references :user, foreign_key: true, index: true

    	t.timestamps
    end
  end

  def down
    drop_table :activity_logs
  end
end
