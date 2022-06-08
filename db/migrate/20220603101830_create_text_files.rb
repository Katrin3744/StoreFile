class CreateTextFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :text_files do |t|
      t.text :description, null: false

      t.timestamps
    end
  end
end
