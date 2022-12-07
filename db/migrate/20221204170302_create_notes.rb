class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :body
      t.boolean :pinned, default: false
      t.string :tags, array: true, default: []

      t.belongs_to :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
