class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.integer :author_id
      t.integer :conclusion_id
      t.boolean :is_supporting

      t.timestamps
    end
  end
end
