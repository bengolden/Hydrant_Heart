class CreateAssumptions < ActiveRecord::Migration
  def change
    create_table :assumptions do |t|

      t.timestamps
    end
  end
end
