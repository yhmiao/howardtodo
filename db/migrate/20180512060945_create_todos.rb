class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true, index: true

      t.timestamps
    end
  end
end
