class CreateAssumptions < ActiveRecord::Migration
  def change
    create_table :assumptions do |t|
	    t.integer  "premise_id"
	    t.integer  "argument_id"
	    
      t.timestamps
    end
  end
end
