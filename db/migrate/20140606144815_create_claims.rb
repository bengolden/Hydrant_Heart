class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.integer :author_id
      t.text :body

      t.timestamps
    end
  end
end
